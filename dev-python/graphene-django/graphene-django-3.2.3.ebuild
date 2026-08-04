# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_14 )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Integrate GraphQL into your Django project"
HOMEPAGE="http://docs.graphene-python.org/projects/django/en/latest/ https://github.com/graphql-python/graphene-django"

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
