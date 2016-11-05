# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_SRC=github.com/remind101/empire
EGO_PN=${EGO_SRC}
EGIT_COMMIT="v${PV}"

DESCRIPTION="A PaaS built on top of Amazon EC2 Container Services."
HOMEPAGE="http://engineering.remind.com/introducing-empire/"
SRC_URI="https://github.com/remind101/empire/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/go"

src_compile() {
	cd "src/${EGO_PN}" || die
	export GOPATH="${WORKDIR}/${P}:${PWD}/vendor"

	emake build/emp build/empire
}

src_install() {
	cd "src/${EGO_PN}" || die
	newbin build/emp emp
	newbin build/empire empire
}
