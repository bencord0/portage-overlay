# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Shamir's secret sharing scheme for UNIX/linux machines."
HOMEPAGE="http://point-at-infinity.org/ssss/"
SRC_URI="http://point-at-infinity.org/ssss/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-doc/xmltoman"
RDEPEND=""

src_install () {
	dobin ssss-split
	dobin ssss-combine
	doman ssss.1
	dodoc ssss.1.html
}
