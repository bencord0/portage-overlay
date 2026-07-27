#!/bin/bash
set -ex

if [[ -f /etc/nspawn-bootstrap.sh ]]; then
    source /etc/nspawn-bootstrap.sh
fi

profile="${1}"
if [[ -z "${profile}" ]]; then
    echo "usage: ${0} <profile>"
    exit 1
fi

machine="${machine_prefix}${profile}"
root="/var/lib/machines/${machine}"
zpool="${zpool:-zpool}"

# Create machine dataset
zfs create -o "mountpoint=${root}" "${zpool}/machines/${machine}"

# Set initial profile
mkdir -pv "${root}/etc/portage"
ln -sf /var/db/repos/bencord0/profiles/default/linux/amd64/nspawn-23 "${root}/etc/portage/make.profile"

cat << EOF > "${root}/etc/portage/repos.conf"
[gentoo]
location = /var/db/repos/gentoo

[bencord0]
location = /var/db/repos/bencord0
EOF

# In lieu of a stage3 tarball
export FEATURES="buildpkg binpkg-multi-instance"
EMERGE_ARGS=(
    # stop before merging packages
    #--ask

    # show emerge intentions
    --verbose

    # binary packages
    --binpkg-respect-use=y
    --binpkg-changed-deps=y
    --buildpkg
    --buildpkg-exclude "acct-group/* acct-user/* virtual/* sys-fs/zfs-kmod */*-bin"

    # parallelise merge
    --jobs

    # don't save world file
    --oneshot

    # target filesystem
    --root="${root}"
    --config-root="${root}"
)

# Setup the basic filesystem layout
# This gets things like the single-usr layout right,
# and symlinks bin,lib,lib64 correctly.
emerge "${EMERGE_ARGS[@]}" sys-apps/baselayout

# Setup gpg keys for the package manager to trust upstream gentoo
emerge "${EMERGE_ARGS[@]}" sec-keys/openpgp-keys-gentoo-release
ROOT="${root}" getuto

# Setup enough of the filesystem to get a working chroot
# USE flags are restricted down to minimise the time spent in this step
PST="$(portageq envvar PYTHON_SINGLE_TARGET)"
export USE="-* build systemd udev gawk pigz"
export PYTHON_SINGLE_TARGET="${PST}"
PACKAGES=(
    sys-libs/glibc
    app-shells/bash
    sys-apps/systemd
)
for PACKAGE in "${PACKAGES[@]}"; do
    emerge "${EMERGE_ARGS[@]}" "${PACKAGE}"
done
unset USE PYTHON_SINGLE_TARGET

# Setup enough of the filesystem to get the package manager working
# USE flags have been reset, derived from the profile.
PACKAGES=(
    app-arch/tar
    app-crypt/gnupg
    app-editors/vim
    sys-apps/findutils
    sys-apps/iproute2
    sys-apps/kbd
    sys-apps/util-linux
)
for PACKAGE in "${PACKAGES[@]}"; do
    emerge "${EMERGE_ARGS[@]}" "${PACKAGE}"
done

# We now have enough in the rootfs to build the rest of the system.
# Some packages will need to be recompiled with new USE flags suitable
# for the final system.
EMERGE_ARGS+=(
    --newuse
    --update
)
emerge "${EMERGE_ARGS[@]}" @system

# Set final profile
rm -v "${root}/etc/portage/make.profile"
ln -sf "/var/db/repos/bencord0/profiles/host/${profile}" "${root}/etc/portage/make.profile"
zfs snap "${zpool}/machines/${machine}@gentoo-clean"

# Install packages specific for the final profile
EMERGE_ARGS+=(
    --sysroot="${root}"
)
emerge "${EMERGE_ARGS[@]}" @world @profile

# Filesystem is complete and ready for use.
zfs snap "${zpool}/machines/${machine}@world-clean"

# Setup control files to launch the container
if [[ ! -d /etc/systemd/nspawn ]]; then
    mkdir -pv /etc/systemd/nspawn
fi

cat << EOF > "/etc/systemd/nspawn/${machine}.nspawn"
[Exec]
Boot=yes
LinkJournal=try-guest
PrivateUsers=no

[Files]
BindReadOnly=/var/db/repos
Bind=/var/cache/distfiles
Bind=/var/cache/binpkgs

[Network]
Private=yes
VirtualEthernet=yes
EOF
