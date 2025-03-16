# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby33"
inherit ruby-ng systemd

DESCRIPTION="Your self-hosted, globally interconnected microblogging community "
HOMEPAGE="https://joinmastodon.org/"

MY_PV="${PV/_rc/-rc.}"
MY_P="${PN}-${MY_PV/-*/}"
SRC_URI="
	https://github.com/mastodon/mastodon/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.tar.gz
	https://dl.condi.me/distfiles/${MY_P}-corepack.tar.xz
	https://dl.condi.me/distfiles/${MY_P}-yarn-cache.tar.xz
	https://dl.condi.me/distfiles/${MY_P}-vendor-bundle.tar.xz
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-db/postgresql
	dev-libs/icu
	net-dns/libidn
	net-libs/nodejs[corepack]
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
	"${FILESDIR}/0001b-order-status-by-created-at.patch"
	"${FILESDIR}/0004-sidekiq-threadresolver.patch"
	"${FILESDIR}/0005-sidekiq-crawler.patch"
)

ruby_add_depend "
	dev-ruby/bundler
"
ruby_add_rdepend "
	dev-ruby/bundler
"

RUBY_S="${PN}-${PV/_*/}"

all_ruby_unpack() {
	unpack ${A}

	if [ -d "${PN}-${MY_PV}" ]; then
		mv  --no-clobber -v "${PN}-${MY_PV}"/* "${PN}-${PV/_*//}/"
	fi
}

all_ruby_compile() {
	# https://bundler.io/man/bundle-config.1.html#CONFIGURE-BUNDLER-DIRECTORIES
	export BUNDLE_USER_CACHE="${PWD}/.bundle/cache"
	export COREPACK_ENABLE_NETWORK=0
	export COREPACK_DEFAULT_TO_LATEST=0

	# bundle install && \
	# tar cvJf ${P}-vendor-bundle.tar.xz ${P}/vendor/bundle
	bundle config set --local deployment 'true' || die
	bundle config set --local without 'development test' || die
	bundle config set --local silence_root_warning true || die
	bundle install || die "Unable to install gems"

	# corepack pack && \
	# tar cvJf ${P}-corepack.tar.xz ${P}/corepack.tgz
	corepack enable || die "corepack enable"
	corepack install -g --cache-only ./corepack.tgz || die "corepack install"

	# tar cvJf ${P}-yarn-cache.tar.xz ${P}/.yarn
	yarn config set --home enableTelemetry 0
	yarn config set enableGlobalCache 0
	yarn config set enableNetwork 0
	yarn install --immutable --immutable-cache || die "yarn install"
	NODE_ENV=production RAILS_ENV=production OTP_SECRET=precompile SECRET_KEY_BASE=precompile \
	ACTIVE_RECORD_ENCRYPTION_DETERMINISTIC_KEY=precompile \
	ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT=precompile \
	ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY=precompile \
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
