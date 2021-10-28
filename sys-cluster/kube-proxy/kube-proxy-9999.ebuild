# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module

case ${PV} in
*9999*)
	EGIT_REPO_URI="https://github.com/bencord0/kubernetes.git"
	EGIT_OVERRIDE_BRANCH_BENCORD0_KUBERNETES="kube-proxy-1.22"
	inherit git-r3
	;;
*)
	SRC_URI="https://github.com/kubernetes/kubernetes/archive/v${PV}.tar.gz -> kubernetes-${PV}.tar.gz"
	S="${WORKDIR}/kubernetes-${PV}"
	;;
esac

DESCRIPTION="Kubernetes Proxy service"
HOMEPAGE="https://github.com/kubernetes/kubernetes https://kubernetes.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm64"
IUSE="hardened"

RDEPEND="net-firewall/conntrack-tools
	!sys-cluster/kubernetes"
BDEPEND=">=dev-lang/go-1.16"

RESTRICT+=" test"

src_compile() {
	CGO_LDFLAGS="$(usex hardened '-fno-PIC ' '')" \
		emake -j1 GOFLAGS="" GOLDFLAGS="" LDFLAGS="" WHAT=cmd/${PN}
}

src_install() {
	dobin _output/bin/${PN}
	keepdir /var/log/${PN} /var/lib/${PN}
	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
	insinto /etc/logrotate.d
	newins "${FILESDIR}"/${PN}.logrotated ${PN}
}
