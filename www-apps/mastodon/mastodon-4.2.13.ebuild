# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32"
inherit ruby-ng systemd

DESCRIPTION="Your self-hosted, globally interconnected microblogging community "
HOMEPAGE="https://joinmastodon.org/"
SRC_URI="
	https://github.com/mastodon/mastodon/archive/refs/tags/v${PV/_/}.tar.gz -> ${P}.tar.gz
	https://dl.condi.me/distfiles/${P}-vendor-bundle.tar.xz
	https://dl.condi.me/distfiles/${P}-home-cache-yarn.tar.xz
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-db/postgresql
	dev-libs/icu
	net-dns/libidn
	sys-apps/yarn
"
RDEPEND="
	acct-user/mastodon
	acct-group/mastodon
	app-admin/awscli-bin
	dev-db/postgresql:*
	>=dev-libs/icu-74
	>=dev-libs/openssl-3.1.0
	media-gfx/imagemagick[jpeg,png,raw,svg,tiff,webp,xml]
	media-video/ffmpeg
	net-dns/libidn
	net-libs/nodejs
"

PATCHES=(
	"${FILESDIR}/0001-order-status-by-created-at.patch"
	"${FILESDIR}/0002b-toot-character-limit-1000.patch"
	"${FILESDIR}/0003a-publish-is-toot.patch"
	"${FILESDIR}/0004-sidekiq-threadresolver.patch"
	"${FILESDIR}/0005-sidekiq-crawler.patch"
)

ruby_add_depend "
	dev-ruby/bundler
"
ruby_add_rdepend "
	dev-ruby/bundler
"

RUBY_S="${PN}-${PV/_/}"

all_ruby_compile() {
	# https://bundler.io/man/bundle-config.1.html#CONFIGURE-BUNDLER-DIRECTORIES
	export BUNDLE_USER_CACHE="${PWD}/.bundle/cache"

	bundle config set --local deployment 'true' || die
	bundle config set --local without 'development test' || die
	bundle config set --local silence_root_warning true || die
	bundle install || die "Unable to install gems"

	cp -av ../.cache $HOME/ || die "copy yarn cache failed"
	yarn install --pure-lockfile --frozen-lockfile --offline || die "yarn install"
	NODE_ENV=production RAILS_ENV=production OTP_SECRET=precompile SECRET_KEY_BASE=precompile \
		bundle exec rake assets:precompile || die "Unable to precompile assets"
}

all_ruby_install() {
	mkdir -p "${D}/usr/share/mastodon" || die "mkdir /usr/share/mastodon"
	cp -av . "${D}/usr/share/mastodon/" || die "install failed"
	chown mastodon:mastodon "${D}/usr/share/mastodon/.bundle/config" || die "chown bundle config"

	systemd_dounit "${FILESDIR}/mastodon.target"
	systemd_dounit "${FILESDIR}/mastodon.service"
	systemd_dounit "${FILESDIR}/mastodon-migrate.service"
	systemd_dounit "${FILESDIR}/mastodon-sidekiq.service"
	systemd_dounit "${FILESDIR}/mastodon-streaming.service"

	cd "${T}"
	cat > env << EOF
BUNDLE_USER_CACHE=/usr/share/mastodon/.bundle/cache
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
