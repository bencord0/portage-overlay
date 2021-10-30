# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=9

PYTHON_COMPAT=( python{2_{6,7},3_{3,4,5}} pypy pypy2_0 )
inherit distutils-r1

DESCRIPTION="Copy + Paste in Python"
HOMEPAGE="https://github.com/kennethreitz/xerox"
SRC_URI="https://github.com/kennethreitz/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
