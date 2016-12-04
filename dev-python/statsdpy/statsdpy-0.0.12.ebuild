# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Eventlet based statsd clone with pickle protocol support"
HOMEPAGE="https://github.com/pandemicsyn/statsdpy"
SRC_URI="https://github.com/pandemicsyn/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/eventlet"
RDEPEND="${DEPEND}"
