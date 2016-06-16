# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=5

DESCRIPTION="The snap-confine program helps to launch snappy applications"
HOMEPAGE="http://snapcraft.io/"
SRC_URI="https://github.com/snapcore/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="sys-devel/automake sys-devel/autoconf dev-util/indent sys-devel/make sys-devel/gcc"

src_configure() {
	econf --host=${CHOST} \
		--disable-confinement \
		--enable-rootfs-is-core-snap \
		--prefix=/usr \
		--infodir=/usr/share/info \
		--mandir=/usr/share/man || die
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README.md PORTING
}
