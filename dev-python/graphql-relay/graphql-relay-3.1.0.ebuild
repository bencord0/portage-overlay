# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="Relay library for GraphQL Python"
HOMEPAGE="https://pypi.org/project/graphql-relay/ https://github.com/graphql-python/graphql-relay-py"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

DISTUTILS_USE_SETUPTOOLS=bdepend
RDEPEND="
	dev-python/graphql-core[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
