# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31"
inherit ruby-fakegem

if [[ ${PV} == 9999 ]] ; then
  inherit git-r3
  EGIT_REPO_URI="https://github.com/ClearlyClaire/webpush.git"
  EGIT_BRANCH="v0.3.8-openssl3"
  EGIT_COMMIT="f14a4d52e201128b1b00245d11b6de80d6cfdcd9"
  EGIT_CHECKOUT_DIR="all"
  SRC_URI=""
fi

RUBY_FAKEGEM_BINWRAP=""

DESCRIPTION="Encryption Utilities for Web Push payload"
HOMEPAGE="https://github.com/zaru/webpush"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-ruby/hkdf
	dev-ruby/jwt
"
RDEPEND="${DEPEND}"
