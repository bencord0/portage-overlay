# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..12} )
inherit distutils-r1

DESCRIPTION="Python wrapper for the Cloudflare Client API v4"
HOMEPAGE="https://github.com/cloudflare/python-cloudflare"
SRC_URI="https://github.com/cloudflare/python-cloudflare/archive/${PV}.tar.gz -> ${P}.tar.gz"

DISTUTILS_USE_SETUPTOOLS=rdepend

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="
	dev-python/beautifulsoup
	dev-python/jsonlines
"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/uninstall-examples.patch"
	"${FILESDIR}/remove-man-pages.patch"
)
