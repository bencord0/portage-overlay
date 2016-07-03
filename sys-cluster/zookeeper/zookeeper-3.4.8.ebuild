# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit user

DESCRIPTION="Highly reliable distributed coordination."
HOMEPAGE="http://zookeeper.apache.org/"
SRC_URI="http://archive.apache.org/dist/zookeeper/${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	>=virtual/jre-1.8.0
"

src_install() {
	newbin "${FILESDIR}/zookeeper.sh" zookeeper

	dodir /usr/share/zookeeper/lib
	insinto /usr/share/zookeeper/lib
	doins "${P}.jar"

	for i in lib/*.jar
	do
		doins "$i"
	done

	dodir /etc/zookeeper
	insinto /etc/zookeeper
	doins conf/zoo_sample.cfg
	doins conf/log4j.properties

	insinto /usr/lib/systemd/system
	doins "${FILESDIR}/zookeeper.service"

	keepdir /var/lib/zookeeper
	keepdir /var/log/zookeeper
}

pkg_setup() {
	enewgroup zookeeper
	enewuser zookeeper -1 -1 /var/lib/zookeeper zookeeper
}
