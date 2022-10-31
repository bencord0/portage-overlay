# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="GraphQL framework for Python"
HOMEPAGE="https://graphene-python.org https://github.com/graphql-python/graphene"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

DISTUTILS_USE_SETUPTOOLS=bdepend
RDEPEND="
	<dev-python/graphql-core-3[${PYTHON_USEDEP}]
	<dev-python/graphql-relay-3[${PYTHON_USEDEP}]
	dev-python/aniso8601[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}/uncapped-aniso8601.patch"
)
