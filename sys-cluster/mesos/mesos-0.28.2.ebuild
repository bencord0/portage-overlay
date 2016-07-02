# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Datacenter Cluster Operating System"
HOMEPAGE="http://mesos.apache.org/"
SRC_URI="http://archive.apache.org/dist/mesos/${PV}/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="python java"

DEPEND="
	dev-cpp/glog
	dev-cpp/gmock
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
		--with-zookeeper=/usr
}
