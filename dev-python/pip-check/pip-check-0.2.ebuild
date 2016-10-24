# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="Display installed pip packages and their update status"
HOMEPAGE="https://pypi.python.org/pypi/pip-check/"
SRC_URI="https://pypi.python.org/packages/37/ba/83222dab44a938a8a23b3813f73c48aa8d99d45a91f14770476ec2f48e5c/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
