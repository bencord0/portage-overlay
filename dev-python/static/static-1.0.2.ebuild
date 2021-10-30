# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="A very simple WSGI way to serve static and dynamic content."
HOMEPAGE="https://github.com/lukearno/static https://pypi.python.org/pypi/static/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/pystache
"

DOCS=( README.md )
