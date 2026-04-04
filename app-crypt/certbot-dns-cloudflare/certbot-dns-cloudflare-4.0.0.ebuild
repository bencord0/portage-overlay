# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{10..13})

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/certbot/certbot.git"
	inherit git-r3
	S=${WORKDIR}/${P}/${PN}
else
	SRC_URI="https://github.com/${PN%-dns-cloudflare}/${PN%-dns-cloudflare}/archive/v${PV}.tar.gz -> ${PN%-dns-cloudflare}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
	S=${WORKDIR}/${PN%-dns-cloudflare}-${PV}/${PN}
fi

inherit distutils-r1

DESCRIPTION="Cloudflare plugin for certbot (Let's Encrypt Client)"
HOMEPAGE="https://github.com/certbot/certbot https://letsencrypt.org/"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

RDEPEND="
	~app-crypt/certbot-${PV}[${PYTHON_USEDEP}]
	~app-crypt/acme-${PV}[${PYTHON_USEDEP}]
	dev-python/python-cloudflare[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
"
