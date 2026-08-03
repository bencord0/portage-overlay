# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_14 )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Radically simplified static file serving for Python web apps"
HOMEPAGE="https://whitenoise.readthedocs.io"
SRC_URI="https://files.pythonhosted.org/packages/source/w/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND=""
BDEPEND=""
