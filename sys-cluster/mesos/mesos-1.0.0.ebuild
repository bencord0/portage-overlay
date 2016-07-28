# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Datacenter Cluster Operating System"
HOMEPAGE="http://mesos.apache.org/"
SRC_URI="http://archive.apache.org/dist/mesos/${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="python java"

DEPEND="
	dev-cpp/glog
	java? (
		dev-java/maven-bin
		virtual/jdk
	)
	dev-libs/apr
	dev-libs/cyrus-sasl
	dev-libs/leveldb
	dev-libs/protobuf
	dev-libs/zookeeper-c
	dev-vcs/subversion
"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_enable python) \
		$(use_enable java) \
		--with-apr=/usr \
		--with-curl=/usr \
		--with-glog=/usr \
		--with-leveldb=/usr \
		--with-nl=/usr \
		--with-protobuf=/usr \
		--with-sasl=/usr \
		--with-svn=/usr \
		--with-zlib=/usr \
		--with-zookeeper=/usr
}

src_install() {
	emake DESTDIR="${D}" install

	dodir /etc/mesos

	insinto /usr/lib/systemd/system
	doins "${FILESDIR}/mesos-master.service"
	doins "${FILESDIR}/mesos-slave.service"

	keepdir /var/lib/mesos
	keepdir /var/log/mesos
}
