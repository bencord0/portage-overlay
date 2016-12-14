# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A messaging app for teams"
HOMEPAGE="slack.com"
SRC_URI="https://downloads.slack-edge.com/linux_releases/${P}-amd64.deb"

LICENSE="no-source-code"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	gnome-base/gconf
"

src_unpack() {
	default
	mkdir -p "${S}"
}

src_install() {
	tar -xf "${WORKDIR}"/data.tar.xz -C "${D}" || die
}
