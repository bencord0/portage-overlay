# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Python library to simplify working with jsonlines and ndjson data"
HOMEPAGE="https://github.com/wbolster/jsonlines"
SRC_URI="https://github.com/wbolster/jsonlines/archive/${PV}.tar.gz -> ${P}.tar.gz"

DISTUTILS_USE_SETUPTOOLS=rdepend

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND=""
BDEPEND=""
