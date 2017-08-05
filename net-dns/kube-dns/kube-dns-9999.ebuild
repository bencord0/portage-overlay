# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGIT_REPO_URI="https://github.com/kubernetes/dns/"

inherit eutils git-r3 golang-build

DESCRIPTION="Kubernetes DNS Services"
HOMEPAGE="https://github.com/kubernetes/dns"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="
	dev-lang/go
	sys-cluster/kubernetes
"
RDEPEND=""

src_prepare() {
	eapply_user
	epatch $FILESDIR/01-disable-pprof.patch
}

src_compile() {
	mkdir -p $WORKDIR/src/k8s.io
	ln -sv $WORKDIR/$P $WORKDIR/src/k8s.io/dns

	cp -av $S/vendor/* $WORKDIR/src/

	export GOPATH=$WORKDIR
	cd $GOPATH/src
	go build -v -x ./k8s.io/dns/cmd/kube-dns || die
}

src_install() {
	insinto /usr/lib/systemd/system
	doins $FILESDIR/kube-dns.service

	dobin $WORKDIR/src/kube-dns
}
