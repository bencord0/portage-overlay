# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="An implementation of the psycopg2 module using cffi"
HOMEPAGE="https://github.com/chtd/psycopg2cffi"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-db/postgresql
	dev-python/cffi[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/six[${PYTHON_USEDEP}]
"
