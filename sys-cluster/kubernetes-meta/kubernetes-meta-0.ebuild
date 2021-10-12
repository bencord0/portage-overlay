# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit systemd

DESCRIPTION="Kubernetes configuration files"
HOMEPAGE="https://kubernetes.io/docs/reference/command-line-tools-reference/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	sys-cluster/kine
	sys-cluster/kube-apiserver
"

S="${WORKDIR}"

src_install() {
	systemd_dounit "${FILESDIR}/kube-apiserver.service"
}
