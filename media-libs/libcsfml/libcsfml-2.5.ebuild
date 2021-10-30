# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

MY_P="CSFML-${PV}"

DESCRIPTION="Simple and Fast Multimedia Library (SFML) for C"
HOMEPAGE="https://www.sfml-dev.org/ https://github.com/SFML/CSFML"
SRC_URI="https://github.com/SFML/CSFML/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0/$(ver_cut 1-2)"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
"
DEPEND="
	media-libs/libsfml
"

DOCS=( license.txt readme.txt )

S="${WORKDIR}/${MY_P}"

src_prepare() {
	sed -i "s:DESTINATION .*:DESTINATION /usr/share/doc/${PF}:" \
		doc/CMakeLists.txt || die

	cmake-utils_src_prepare
}
