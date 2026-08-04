# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_14 )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1 pypi

DESCRIPTION="GraphQL implementation for Python"
HOMEPAGE="https://pypi.org/project/graphql-core/ https://github.com/graphql-python/graphql-core"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

RDEPEND="
	dev-python/rx[${PYTHON_USEDEP}]
"
