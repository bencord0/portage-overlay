# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby31"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="JSON formatter for SimpleCov"
HOMEPAGE="https://github.com/codeclimate-community/simplecov_json_formatter"
LICENSE="MIT"

KEYWORDS="~amd64 ~riscv"
SLOT="$(ver_cut 1)"
IUSE="doc"

# Not packaged in the gem and very fragile for e.g. simplecov versions
RESTRICT="test"
