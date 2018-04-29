# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="OpenTracing API for C++"
HOMEPAGE="http://opentracing.io"
SRC_URI="https://github.com/opentracing/opentracing-cpp/archive/v1.3.0.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/cmake-libdir.patch"
)
