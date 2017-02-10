# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=(python2_7 python3_4 python3_5 python3_6 pypy pypy3)

inherit distutils-r1

DESCRIPTION="Flake8 and pylama plugin that checks the ordering of import statements"
HOMEPAGE="https://pypi.python.org/pypi/flake8-import-order"
SRC_URI="https://github.com/PyCQA/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/pep8
"
RDEPEND="${DEPEND}"
