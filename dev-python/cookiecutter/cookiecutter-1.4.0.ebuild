# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4,5} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="A command line utility that creates projects from cookiecutters"
HOMEPAGE="https://cookiecutter.readthedocs.io"
SRC_URI="https://github.com/audreyr/cookiecutter/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=dev-python/jinja2-time-0.1.0
	>=dev-python/poyo-0.1.0
	>=dev-python/whichcraft-0.1.1
	>=dev-python/click-5.0
	>=dev-python/binaryornot-0.2.0
	>=dev-python/future-0.15.2
"
