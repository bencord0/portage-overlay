# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_14 )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An implementation of the psycopg2 module using cffi"
HOMEPAGE="https://github.com/chtd/psycopg2cffi"

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
