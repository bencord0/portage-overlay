# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
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
	#"${FILESDIR}/remove-man-pages.patch"
)
