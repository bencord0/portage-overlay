# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
EGO_PN=github.com/snapcore/snapd
EGO_SRC=github.com/snapcore/snapd/...

DESCRIPTION="Service and tools for management of snap packages"
HOMEPAGE="http://snapcraft.io/"

EGIT_COMMIT="3a332bd5a475dc651ea5d092f4c84ac06891b2c2"
SRC_URI="https://github.com/snapcore/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
inherit golang-vcs-snapshot
inherit systemd

IUSE=""
DEPEND=""
RDEPEND="sys-apps/snap-confine sys-fs/squashfs-tools"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="dev-vcs/git dev-vcs/bzr"

# TODO: package all the upstream dependencies
# TODO: ensure that used kernel supports xz compression for squashfs
# TODO: enable tests
# TODO: ship man page for snap
# TODO: use more of the gentoo golang packaging helpers
# TODO: put /var/lib/snpad/desktop on XDG_DATA_DIRS

src_compile() {
	# Create a writable GOROOT in order to avoid sandbox violations.
	cp -sR "$(go env GOROOT)" "${T}/goroot" || die
	rm -rf "${T}/goroot/src/${EGO_SRC}" || die
	rm -rf "${T}/goroot/pkg/$(go env GOOS)_$(go env GOARCH)/${EGO_SRC}" || die
	export GOROOT="${T}/goroot"
	# Exclude $(get_golibdir_gopath) from GOPATH, for bug 577908 which may
	# or may not manifest, depending on what libraries are installed.
	export GOPATH="${WORKDIR}/${P}"
	cd src/${EGO_PN} && ./get-deps.sh
	go install -v "${EGO_PN}/cmd/snapd" || die
	go install -v "${EGO_PN}/cmd/snap" || die
	# go install -v -work -x ${EGO_BUILD_FLAGS} "${EGO_PN}/cmd/snapd" || die
}

src_install() {
	# Install snap and snapd
	export GOPATH="${WORKDIR}/${P}"
	exeinto /usr/bin
	dobin "$GOPATH/bin/snap"
	exeinto /usr/lib/snapd/
	doexe "$GOPATH/bin/snapd"
	cd "src/${EGO_PN}" || die
	# Install systemd units
	systemd_dounit debian/snapd.{service,socket}
	systemd_dounit debian/snapd.refresh.{service,timer}
	# Work around https://github.com/zyga/snapd-gentoo/issues/1
	sed -i -e 's/RandomizedDelaySec=/#RandomizedDelaySec=/' debian/snapd.refresh.timer
	# NOTE: the two "frameworks" units should be dropped upstream soon
	systemd_dounit debian/snapd.frameworks.target
	systemd_dounit debian/snapd.frameworks-pre.target
	# Put /snap/bin on PATH
	dodir /etc/profile.d/
	echo 'PATH=$PATH:/snap/bin' > ${D}/etc/profile.d/snapd.sh
}

pkg_postinst() {
	systemctl enable snapd.socket
	systemctl enable snapd.refresh.timer
}
