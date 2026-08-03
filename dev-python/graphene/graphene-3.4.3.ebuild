# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_14 )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="GraphQL framework for Python"
HOMEPAGE="https://graphene-python.org https://github.com/graphql-python/graphene"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

DISTUTILS_USE_SETUPTOOLS=bdepend
RDEPEND="
	<dev-python/graphql-core-3[${PYTHON_USEDEP}]
	<dev-python/graphql-relay-3[${PYTHON_USEDEP}]
"
