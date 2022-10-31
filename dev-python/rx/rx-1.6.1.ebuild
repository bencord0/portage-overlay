# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="The Reactive Extensions for Python"
HOMEPAGE="http://reactivex.io/ https://github.com/ReactiveX/RxPY/tree/release/v1.6.x"
SRC_URI="mirror://pypi/R/Rx/Rx-${PV}.tar.gz"
S="${WORKDIR}/Rx-${PV}"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
