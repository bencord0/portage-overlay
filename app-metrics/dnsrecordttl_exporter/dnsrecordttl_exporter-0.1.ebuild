# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8} )

inherit distutils-r1

DESCRIPTION="A Prometheus exporter for tracking DNS Record TTLs"
HOMEPAGE="https://github.com/bencord0/dnsrecordttl_exporter"
SRC_URI="https://github.com/bencord0/dnsrecordttl_exporter/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/dnspython
	dev-python/prometheus_client
	dev-python/pyyaml
"
RDEPEND="${DEPEND}"
BDEPEND=""
