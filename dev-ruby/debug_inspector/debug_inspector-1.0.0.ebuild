# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby27 ruby30 ruby31"
RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_BINWRAP=""
inherit ruby-fakegem

DESCRIPTION="Adds methods to RubyVM::DebugInspector to inspect backtrace frames"
HOMEPAGE="https://rubygems.org/gems/debug_inspector"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
