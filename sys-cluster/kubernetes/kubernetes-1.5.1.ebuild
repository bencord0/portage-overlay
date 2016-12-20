# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Production-Grade Container Orchestration"
HOMEPAGE="kubernetes.io"
SRC_URI="https://storage.googleapis.com/kubernetes-release/release/v${PV}/kubernetes-server-linux-amd64.tar.gz -> kubernetes-server-linux-amd64-v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	local KUBE_BINARIES=$(find server/ -executable -type f)

	for binary in $KUBE_BINARIES; do
		dobin $binary
	done
}
