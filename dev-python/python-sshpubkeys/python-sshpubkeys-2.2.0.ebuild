# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 python3_5 python3_6 )
inherit distutils-r1

DESCRIPTION="OpenSSH public key parser for Python"
HOMEPAGE="https://pypi.python.org/pypi/sshpubkeys"
SRC_URI="https://github.com/ojarva/python-sshpubkeys/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/ecdsa
	dev-python/pycrypto
"
