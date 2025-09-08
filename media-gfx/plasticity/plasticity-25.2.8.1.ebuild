# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm xdg-utils

DESCRIPTION="Powerful solid and surface modeling software"
HOMEPAGE="plasticity.xyz"
SRC_URI="https://github.com/nkallen/plasticity/releases/download/v25.2.8/Plasticity-25.2.8-1.x86_64.rpm"

LICENSE="plasticity"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	mkdir "${S}"
	pushd "${S}"

	rpm_src_unpack ${A}
	popd
}

src_compile() {
	mv -v "${S}/usr/share/doc/Plasticity" "${S}/usr/share/doc/${P}"
}

src_install() {
	cp -av "${S}/usr" "${D}/usr"
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
