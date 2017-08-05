# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGIT_REPO_URI="https://github.com/kubernetes/dns/"

inherit git-r3 golang-build

DESCRIPTION="Kubernetes DNS Services"
HOMEPAGE="https://github.com/kubernetes/dns"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="
	dev-lang/go
"
RDEPEND=""


src_compile() {
	mkdir -p $WORKDIR/src/k8s.io
	ln -sv $WORKDIR/$P $WORKDIR/src/k8s.io/dns

	export GOPATH="$WORKDIR"
	go build -v -x k8s.io/dns/cmd/kube-dns
}

src_install() {
	insinto /usr/lib/systemd/system
	doins $FILESDIR/kube-dns.service

	dobin kube-dns
}
