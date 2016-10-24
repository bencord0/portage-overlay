# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=(python2_7 python3_4 python3_5 pypy pypy3)
EGIT_REPO_URI="https://github.com/public/${PN}"
EGIT_COMMIT="61ca64d9468ba649d39514ea6b8b2a3e6623c6e3"

inherit distutils-r1 git-r3

DESCRIPTION="Flake8 and pylama plugin that checks the ordering of import statements"
HOMEPAGE="https://pypi.python.org/pypi/flake8-import-order"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/pep8
"
RDEPEND="${DEPEND}"
