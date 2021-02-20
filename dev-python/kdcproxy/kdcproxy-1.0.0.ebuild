# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
inherit distutils-r1

DESCRIPTION="A kerberos KDC HTTP/HTTPS proxy WSGI module"
HOMEPAGE="https://github.com/latchset/kdcproxy"
SRC_URI="https://github.com/latchset/kdcproxy/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DISTUTILS_USE_SETUPTOOLS=bdepend

DEPEND=""
RDEPEND="
	dev-python/pyasn1
	dev-python/dnspython
"
BDEPEND=""
