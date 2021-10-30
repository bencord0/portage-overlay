# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A Reasonable Expectation of Privacy"
HOMEPAGE="http://www.tedunangst.com/flak/post/reop"
SRC_URI="http://www.tedunangst.com/flak/files/${P}.tgz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/sodium"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/GNUmakefile.patch"
}
