# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_14 )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Simple and nonobstructive jinja2 integration with Django"
HOMEPAGE="https://github.com/niwinz/django-jinja"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

DISTUTILS_USE_SETUPTOOLS=rdepend
RDEPEND="
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/django[${PYTHON_USEDEP}]
"
