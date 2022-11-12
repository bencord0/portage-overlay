# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby27 ruby30"
inherit ruby-ng systemd

DESCRIPTION="Your self-hosted, globally interconnected microblogging community "
HOMEPAGE="https://joinmastodon.org/"
SRC_URI="https://github.com/mastodon/mastodon/archive/refs/tags/v${PV/_/}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	acct-user/mastodon
	acct-group/mastodon
	net-libs/nodejs
	sys-apps/yarn
	www-servers/puma
"

RUBY_S="${PN}-${PV/_/}"

all_ruby_install() {
	insinto /usr/share/mastodon
	doins -r .

	systemd_dounit "${FILESDIR}/mastodon.service"
	systemd_dounit "${FILESDIR}/mastodon-sidekiq.service"
	systemd_dounit "${FILESDIR}/mastodon-streaming.service"

	cd "${T}"
	cat > env << EOF
NODE_ENV=production
RAILS_ENV=production
LOCAL_DOMAIN=mastodon.local

OTP_SECRET=
SECRET_KEY_BASE=

VAPID_PRIVATE_KEY=
VAPID_PUBLIC_KEY=
EOF
	insinto /etc/mastodon
	insopts -m 600
	doins env
}
