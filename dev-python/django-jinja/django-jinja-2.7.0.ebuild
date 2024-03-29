# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Simple and nonobstructive jinja2 integration with Django"
HOMEPAGE="https://github.com/niwinz/django-jinja"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

DISTUTILS_USE_SETUPTOOLS=rdepend
RDEPEND="
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/django[${PYTHON_USEDEP}]
"
