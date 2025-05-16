# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A kerberos management Web UI"
HOMEPAGE="https://github.com/bencord0/kadminweb"
SRC_URI="https://github.com/bencord0/kadminweb/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="
	dev-python/django[${PYTHON_USEDEP}]
	dev-python/dj-database-url[${PYTHON_USEDEP}]
	dev-python/pykerberos:02strich[${PYTHON_USEDEP}]
	dev-python/whitenoise[${PYTHON_USEDEP}]
	www-servers/gunicorn[${PYTHON_USEDEP}]
"
BDEPEND=""
