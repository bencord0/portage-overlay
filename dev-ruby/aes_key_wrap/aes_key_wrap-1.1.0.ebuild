# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31"
RUBY_FAKEGEM_BINWRAP=""
inherit ruby-fakegem

DESCRIPTION="A Ruby implementation of AES Key Wrap, a.k.a RFC 3394, a.k.a NIST Key Wrap."
HOMEPAGE="https://rubygems.org/gems/aes_key_wrap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
