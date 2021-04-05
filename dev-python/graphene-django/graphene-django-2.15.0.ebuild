# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="Integrate GraphQL into your Django project"
HOMEPAGE="http://docs.graphene-python.org/projects/django/en/latest/ https://github.com/graphql-python/graphene-django"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

DISTUTILS_USE_SETUPTOOLS=bdepend
DEPEND="
	dev-python/pytest-runner[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/graphene[${PYTHON_USEDEP}]
	dev-python/graphql-core[${PYTHON_USEDEP}]
	dev-python/django[${PYTHON_USEDEP}]
	dev-python/promise[${PYTHON_USEDEP}]
	dev-python/text-unidecode[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}/install-requires-singledispatch.patch"
)
