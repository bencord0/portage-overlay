# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 pypy )
inherit distutils-r1

DESCRIPTION="The cli emoji keyboard"
HOMEPAGE="https://github.com/kennethreitz/em"
SRC_URI="https://github.com/kennethreitz/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	dev-python/docopt
	dev-python/xerox
"
