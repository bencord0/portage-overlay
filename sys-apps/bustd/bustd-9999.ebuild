# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
argh-0.1.5
cc-1.0.68
cfg-if-1.0.0
daemonize-0.4.1
lazy_static-1.4.0
libc-0.2.97
no-panic-0.1.15
procfs-0.9.1
"

inherit cargo systemd

DESCRIPTION="process killer for out-of-memory scenarios"
HOMEPAGE="https://github.com/vrmiguel/bustd"
IUSE=""

if [[ ${PV} == *9999 ]] ; then
	#EGIT_REPO_URI="https://github.com/vrmiguel/${PN}.git"
	EGIT_REPO_URI="https://github.com/bencord0/${PN}.git"
	inherit git-r3
else
	CRATES+=" ${P//_/-}"
	SRC_URI="$(cargo_crate_uris ${CRATES})"
	S="${WORKDIR}/${P//_/-}"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="virtual/rust"

src_unpack() {
	if [[ ${PV} = *9999 ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
		tar -xf "${DISTDIR}/${P//_/-}.crate" -C "${WORKDIR}" || die
	fi
}

src_install() {
	cargo_src_install
	einstalldocs

	systemd_newunit "${FILESDIR}/${PN}.service" "${PN}.service"
}
