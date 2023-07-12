# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="VSCode in the browser"
HOMEPAGE="https://code-server.dev"
SRC_URI="https://github.com/coder/code-server/releases/download/v${PV}/${P}-linux-amd64.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	acct-user/code
	acct-group/code
"
BDEPEND=""

S="${WORKDIR}/${P}-linux-amd64"

src_install() {
	mkdir -p "${D}/usr/lib/code-serber" || die "mkdir /usr/lib/code-server"
	cp -av . "${D}/usr/lib/code-server" || die "install failed"

	systemd_dounit "${FILESDIR}/code-server.service"
}
