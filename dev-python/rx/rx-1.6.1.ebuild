# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_14 )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="Rx"
inherit distutils-r1 pypi

DESCRIPTION="The Reactive Extensions for Python"
HOMEPAGE="http://reactivex.io/ https://github.com/ReactiveX/RxPY/tree/release/v1.6.x"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
