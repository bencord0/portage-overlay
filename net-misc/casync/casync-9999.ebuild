# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit meson

DESCRIPTION="A tool for distributing file system images"
HOMEPAGE="http://0pointer.net/blog/casync-a-tool-for-distributing-file-system-images.html"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="git://github.com/systemd/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/systemd/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-arch/zstd
	>=dev-util/meson-0.41.0
	dev-util/ninja
	sys-fs/fuse
"
RDEPEND="
	sys-fs/fuse
"
