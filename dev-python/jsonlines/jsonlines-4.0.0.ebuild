# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1

DESCRIPTION="Python library to simplify working with jsonlines and ndjson data"
HOMEPAGE="https://github.com/wbolster/jsonlines"
SRC_URI="https://github.com/wbolster/jsonlines/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND=""
BDEPEND=""
