# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A dracut module to asset creating squashfs/overlayfs rootfses"
HOMEPAGE="https://github.com/bencord0/squashedoverlay-root"
SRC_URI="https://github.com/bencord0/squashedoverlay-root/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	if [[ ${SYMLINK_LIB} = yes && $(get_libdir) != lib ]]; then
		# Preserve lib -> lib64 symlink
		LIBDIR=/usr/lib
	else
		LIBDIR="/usr/$(get_libdir)"
	fi

	emake DESTDIR="${D}" LIBDIR="${LIBDIR:-/usr/lib}" install
}
