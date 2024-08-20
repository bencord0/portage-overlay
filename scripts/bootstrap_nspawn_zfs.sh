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
cp -v  /var/db/repos/bencord0/profiles/base/linux/amd64/23.0/binrepos.conf "${root}/etc/portage/binrepos.conf"
ln -sf /var/db/repos/bencord0/profiles/default/linux/amd64/nspawn-23 "${root}/etc/portage/make.profile"

cat << EOF > "${root}/etc/portage/repos.conf"
[gentoo]
location = /var/db/repos/gentoo

[bencord0]
location = /var/db/repos/bencord0
EOF

# In lieu of a stage3 tarball
emerge --jobs --root="${root}" --config-root="${root}" sys-apps/baselayout
USE="build -udev" emerge --jobs --root="${root}" --config-root="${root}" @system

# Set final profile
rm -v "${root}/etc/portage/make.profile"
ln -sf "/var/db/repos/bencord0/profiles/host/${profile}" "${root}/etc/portage/make.profile"
zfs snap "${zpool}/machines/${machine}@gentoo-clean"

emerge --jobs --root="${root}" --sysroot="${sysroot}" --config-root="${root}" @world @profile
zfs snap "${zpool}/machines/${machine}@world-clean"

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
Bridge=br0
EOF
