# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Tools that work directly on Gluster volumes"
HOMEPAGE="https://github.com/gluster/glusterfs-coreutils"
SRC_URI="https://github.com/gluster/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-cluster/glusterfs"
RDEPEND="sys-cluster/glusterfs"
