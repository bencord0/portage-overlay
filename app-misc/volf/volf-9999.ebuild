# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit eutils git-r3

EGIT_REPO_URI="https://github.com/clux/volf.git"

DESCRIPTION="A github webhook server"
HOMEPAGE="https://github.com/clux/volf"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	|| ( dev-lang/rust dev-lang/rust-bin )
"

# From rust overlay
DEPEND+="
	|| ( dev-util/cargo dev-util/cargo-bin )
"

src_compile() {
	cargo build --release
}

src_install() {
	dobin target/release/volf
}
