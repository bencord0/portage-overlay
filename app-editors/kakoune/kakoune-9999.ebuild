# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EGIT_REPO_URI="https://github.com/mawww/kakoune"
EGIT_BRANCH="master"

inherit git-r3

DESCRIPTION="mawww's experiment for a better code editor"
HOMEPAGE="http://kakoune.org/"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-libs/boost
	sys-libs/ncurses
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/src"
