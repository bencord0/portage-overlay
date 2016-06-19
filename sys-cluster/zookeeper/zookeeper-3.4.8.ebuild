# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Highly reliable distributed coordination."
HOMEPAGE="http://zookeeper.apache.org/"
SRC_URI="http://archive.apache.org/dist/zookeeper/${PV}/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/src/c"

src_install() {
	emake DESTDIR="${D}" install
	dobin "${WORKDIR}/${P}/dist-maven/${P}.jar"
}
