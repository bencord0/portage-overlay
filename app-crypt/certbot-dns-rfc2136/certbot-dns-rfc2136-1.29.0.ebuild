# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=(python3_{8..10})
DISTUTILS_USE_SETUPTOOLS=rdepend

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/certbot/certbot.git"
	inherit git-r3
	S=${WORKDIR}/${P}/${PN}
else
	SRC_URI="https://github.com/${PN%-dns-rfc2136}/${PN%-dns-rfc2136}/archive/v${PV}.tar.gz -> ${PN%-dns-rfc2136}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
	S=${WORKDIR}/${PN%-dns-rfc2136}-${PV}/${PN}
fi

inherit distutils-r1

DESCRIPTION="DNS01 rfc2136 plugin for certbot (Let's Encrypt Client)"
HOMEPAGE="https://github.com/certbot/certbot https://letsencrypt.org/"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

CDEPEND=">=dev-python/setuptools-1.0[${PYTHON_USEDEP}]"
RDEPEND="${CDEPEND}
	~app-crypt/certbot-${PV}[${PYTHON_USEDEP}]
	~app-crypt/acme-${PV}[${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
"
DEPEND="${CDEPEND}"
