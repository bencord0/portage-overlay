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

RESTRICT="network-sandbox"
DEPEND="
	dev-nodejs/webpack
	sys-apps/yarn
"
RDEPEND="
	acct-user/mastodon
	acct-group/mastodon
	net-libs/nodejs
"


ruby_add_rdepend "
~dev-ruby/actioncable-6.1.7
~dev-ruby/actionmailbox-6.1.7
~dev-ruby/actionmailer-6.1.7
~dev-ruby/actionpack-6.1.7
~dev-ruby/actiontext-6.1.7
~dev-ruby/actionview-6.1.7
~dev-ruby/active_model_serializers-0.10.13
~dev-ruby/active_record_query_trace-1.8
~dev-ruby/activejob-6.1.7
~dev-ruby/activemodel-6.1.7
~dev-ruby/activerecord-6.1.7
~dev-ruby/activestorage-6.1.7
~dev-ruby/activesupport-6.1.7
~dev-ruby/addressable-2.8.1
~dev-ruby/aes_key_wrap-1.1.0
~dev-ruby/airbrussh-1.4.1
~dev-ruby/android_key_attestation-0.3.0
~dev-ruby/annotate-3.2.0
~dev-ruby/ast-2.4.2
~dev-ruby/attr_encrypted-3.1.0
~dev-ruby/attr_required-1.0.1
~dev-ruby/awrence-1.2.1
~dev-ruby/aws-eventstream-1.2.0
~dev-ruby/aws-partitions-1.587.0
~dev-ruby/aws-sdk-core-3.130.2
~dev-ruby/aws-sdk-kms-1.56.0
~dev-ruby/aws-sdk-s3-1.114.0
~dev-ruby/aws-sigv4-1.5.0
~dev-ruby/bcrypt-ruby-3.1.17
~dev-ruby/better_errors-2.9.1
~dev-ruby/better_html-2.0.1
~dev-ruby/bindata-2.4.10
~dev-ruby/binding_of_caller-1.0.0
~dev-ruby/blurhash-0.1.6
~dev-ruby/bootsnap-1.13.0
~dev-ruby/brakeman-5.3.1
~dev-ruby/browser-4.2.0
~dev-ruby/brpoplpush-redis_script-0.1.2
~dev-ruby/builder-3.2.4
~dev-ruby/bullet-7.0.3
~dev-ruby/bundler-audit-0.9.1
~dev-ruby/byebug-11.1.3
~dev-ruby/capistrano-3.17.1
~dev-ruby/capistrano-bundler-2.0.1
~dev-ruby/capistrano-rails-1.6.2
~dev-ruby/capistrano-rbenv-2.2.0
~dev-ruby/capistrano-yarn-2.0.2
~dev-ruby/capybara-3.37.1
~dev-ruby/case_transform-0.2
~dev-ruby/cbor-0.5.9.6
~dev-ruby/charlock_holmes-0.7.7
~dev-ruby/chewy-7.2.4
~dev-ruby/chunky_png-1.4.0
~dev-ruby/climate_control-0.2.0
~dev-ruby/cocoon-1.2.15
~dev-ruby/coderay-1.1.3
~dev-ruby/color_diff-0.1
~dev-ruby/concurrent-ruby-1.1.10
~dev-ruby/connection_pool-2.3.0
~dev-ruby/cose-1.2.1
~dev-ruby/crack-0.4.5
~dev-ruby/crass-1.0.6
~dev-ruby/css_parser-1.7.1
~dev-ruby/debug_inspector-1.0.0
~dev-ruby/devise-4.8.1
~dev-ruby/devise-two-factor-4.0.2
~dev-ruby/diff-lcs-1.5.0
~dev-ruby/discard-1.2.1
~dev-ruby/docile-1.3.4
~dev-ruby/domain_name-0.5.20190701
~dev-ruby/doorkeeper-5.6.0
~dev-ruby/dotenv-2.8.1
~dev-ruby/dotenv-rails-2.8.1
~dev-ruby/ed25519-1.3.0
~dev-ruby/elasticsearch-7.13.3
~dev-ruby/elasticsearch-api-7.13.3
~dev-ruby/elasticsearch-dsl-0.1.10
~dev-ruby/elasticsearch-transport-7.13.3
~dev-ruby/encryptor-3.0.0
~dev-ruby/erubi-1.11.0
~dev-ruby/et-orbi-1.2.7
~dev-ruby/excon-0.76.0
~dev-ruby/fabrication-2.30.0
~dev-ruby/faker-2.23.0
~dev-ruby/faraday-1.9.3
~dev-ruby/faraday-em_http-1.0.0
~dev-ruby/faraday-em_synchrony-1.0.0
~dev-ruby/faraday-excon-1.1.0
~dev-ruby/faraday-httpclient-1.0.1
~dev-ruby/faraday-multipart-1.0.3
~dev-ruby/faraday-net_http-1.0.1
~dev-ruby/faraday-net_http_persistent-1.2.0
~dev-ruby/faraday-patron-1.0.0
~dev-ruby/faraday-rack-1.0.0
~dev-ruby/faraday-retry-1.0.3
~dev-ruby/fast_blank-1.0.1
~dev-ruby/fastimage-2.2.6
~dev-ruby/ffi-1.15.5
~dev-ruby/ffi-compiler-1.0.1
~dev-ruby/fog-core-2.1.0
~dev-ruby/fog-json-1.2.0
~dev-ruby/fog-openstack-0.3.10
~dev-ruby/formatador-0.2.5
~dev-ruby/fugit-1.7.1
~dev-ruby/fuubar-2.5.1
~dev-ruby/gitlab-omniauth-openid-connect-0.10.0
~dev-ruby/globalid-1.0.0
~dev-ruby/hamlit-2.13.0
~dev-ruby/hamlit-rails-0.2.3
~dev-ruby/hashdiff-1.0.1
~dev-ruby/hashie-5.0.0
~dev-ruby/highline-2.0.3
~dev-ruby/hiredis-0.6.3
~dev-ruby/hkdf-0.3.0
~dev-ruby/htmlentities-4.3.4
~dev-ruby/http-5.1.0
~dev-ruby/http-cookie-1.0.5
~dev-ruby/http-form_data-2.3.0
~dev-ruby/http_accept_language-2.1.1
~dev-ruby/httpclient-2.8.3
~dev-ruby/httplog-1.6.0
~dev-ruby/i18n-1.12.0
~dev-ruby/i18n-tasks-1.0.12
~dev-ruby/idn-ruby-0.1.4
~dev-ruby/ipaddress-0.8.3
~dev-ruby/jmespath-1.6.1
~dev-ruby/json-2.6.2
~dev-ruby/json-canonicalization-0.3.0
~dev-ruby/json-jwt-1.13.0
~dev-ruby/json-ld-3.2.3
~dev-ruby/json-ld-preloaded-3.2.0
~dev-ruby/jsonapi-renderer-0.2.2
~dev-ruby/jwt-2.4.1
~dev-ruby/kaminari-1.2.2
~dev-ruby/kaminari-actionview-1.2.2
~dev-ruby/kaminari-activerecord-1.2.2
~dev-ruby/kaminari-core-1.2.2
~dev-ruby/kt-paperclip-7.1.1
~dev-ruby/launchy-2.5.0
~dev-ruby/letter_opener-1.8.1
~dev-ruby/letter_opener_web-2.0.0
~dev-ruby/link_header-0.0.8
~dev-ruby/llhttp-ffi-0.4.0
~dev-ruby/lograge-0.12.0
~dev-ruby/loofah-2.19.0
~dev-ruby/mail-2.7.1
~dev-ruby/makara-0.5.1
~dev-ruby/marcel-1.0.2
~dev-ruby/mario-redis-lock-1.2.1
~dev-ruby/matrix-0.4.2
~dev-ruby/memory_profiler-1.0.0
~dev-ruby/method_source-1.0.0
~dev-ruby/microformats-4.4.1
~dev-ruby/mime-types-3.4.1
~dev-ruby/mime-types-data-3.2022.0105
~dev-ruby/mini_mime-1.1.2
~dev-ruby/mini_portile2-2.8.0
~dev-ruby/minitest-5.16.3
~dev-ruby/msgpack-1.5.4
~dev-ruby/multi_json-1.15.0
~dev-ruby/multipart-post-2.1.1
~dev-ruby/ruby-net-ldap-0.17.1
~dev-ruby/net-scp-4.0.0
~dev-ruby/net-ssh-7.0.1
~dev-ruby/nio4r-2.5.8
~dev-ruby/nokogiri-1.13.8
~dev-ruby/nsa-0.2.8
~dev-ruby/oj-3.13.21
~dev-ruby/omniauth-1.9.2
~dev-ruby/omniauth-cas-2.0.0
~dev-ruby/omniauth-rails_csrf_protection-0.1.2
~dev-ruby/omniauth-saml-1.10.3
~dev-ruby/openid_connect-1.3.0
~dev-ruby/openssl-3.0.0
~dev-ruby/openssl-signature_algorithm-1.2.1
~dev-ruby/orm_adapter-0.5.0
~dev-ruby/ox-2.14.11
~dev-ruby/parallel-1.22.1
~dev-ruby/parser-3.1.2.1
~dev-ruby/parslet-2.0.0
~dev-ruby/pastel-0.8.0
~dev-ruby/pg-1.4.3
~dev-ruby/pghero-2.8.3
~dev-ruby/pkg-config-1.4.9
~dev-ruby/posix-spawn-0.3.15
~dev-ruby/premailer-1.14.2
~dev-ruby/premailer-rails-1.11.1
~dev-ruby/private_address_check-0.5.0
~dev-ruby/pry-0.14.1
~dev-ruby/pry-byebug-3.10.1
~dev-ruby/pry-rails-0.3.9
~dev-ruby/public_suffix-5.0.0
~dev-ruby/pundit-2.2.0
~dev-ruby/raabro-1.4.0
~dev-ruby/racc-1.6.0
~dev-ruby/rack-2.2.4
~dev-ruby/rack-attack-6.6.1
~dev-ruby/rack-cors-1.1.1
~dev-ruby/rack-oauth2-1.19.0
~dev-ruby/rack-proxy-0.7.0
~dev-ruby/rack-test-2.0.2
~dev-ruby/rails-6.1.7
~dev-ruby/rails-controller-testing-1.0.5
~dev-ruby/rails-dom-testing-2.0.3
~dev-ruby/rails-html-sanitizer-1.4.3
~dev-ruby/rails-i18n-6.0.0
~dev-ruby/rails-settings-cached-0.6.6
~dev-ruby/railties-6.1.7
~dev-ruby/rainbow-3.1.1
~dev-ruby/rake-13.0.6
~dev-ruby/rdf-3.2.9
~dev-ruby/rdf-normalize-0.5.0
~dev-ruby/redcarpet-3.5.1
~dev-ruby/redis-4.5.1
~dev-ruby/redis-namespace-1.9.0
~dev-ruby/regexp_parser-2.5.0
~dev-ruby/request_store-1.5.1
~dev-ruby/responders-3.0.1
~dev-ruby/rexml-3.2.5
~dev-ruby/rotp-6.2.0
~dev-ruby/rqrcode-2.1.2
~dev-ruby/rqrcode_core-1.2.0
~dev-ruby/rspec-3.11.0
~dev-ruby/rspec-core-3.11.0
~dev-ruby/rspec-expectations-3.11.0
~dev-ruby/rspec-mocks-3.11.1
~dev-ruby/rspec-rails-5.1.2
~dev-ruby/rspec-sidekiq-3.1.0
~dev-ruby/rspec-support-3.11.1
~dev-ruby/rspec_junit_formatter-0.6.0
~dev-ruby/rubocop-1.30.1
~dev-ruby/rubocop-ast-1.18.0
~dev-ruby/rubocop-rails-2.15.0
~dev-ruby/ruby-progressbar-1.11.0
~dev-ruby/ruby-saml-1.13.0
~dev-ruby/ruby2_keywords-0.0.5
~dev-ruby/rufus-scheduler-3.8.2
~dev-ruby/safety_net_attestation-0.4.0
~dev-ruby/sanitize-6.0.0
~dev-ruby/scenic-1.6.0
~dev-ruby/semantic_range-3.0.0
~dev-ruby/sidekiq-6.5.7
~dev-ruby/sidekiq-bulk-0.2.0
~dev-ruby/sidekiq-scheduler-4.0.3
~dev-ruby/sidekiq-unique-jobs-7.1.27
~dev-ruby/simple-navigation-4.4.0
~dev-ruby/simple_form-5.1.0
~dev-ruby/simplecov-0.21.2
~dev-ruby/simplecov-html-0.12.3
~dev-ruby/simplecov_json_formatter-0.1.2
~dev-ruby/smart_properties-1.17.0
~dev-ruby/sprockets-3.7.2
~dev-ruby/sprockets-rails-3.4.2
~dev-ruby/sshkit-1.21.2
~dev-ruby/stackprof-0.2.22
~dev-ruby/statsd-ruby-1.5.0
~dev-ruby/stoplight-3.0.0
~dev-ruby/strong_migrations-0.7.9
~dev-ruby/swd-1.3.0
~dev-ruby/temple-0.8.2
~dev-ruby/terminal-table-3.0.2
~dev-ruby/terrapin-0.6.0
~dev-ruby/thor-1.2.1
~dev-ruby/tilt-2.0.11
~dev-ruby/tpm-key_attestation-0.11.0
~dev-ruby/tty-color-0.6.0
~dev-ruby/tty-cursor-0.7.1
~dev-ruby/tty-prompt-0.23.1
~dev-ruby/tty-reader-0.9.0
~dev-ruby/tty-screen-0.8.1
~dev-ruby/twitter-text-3.1.0
~dev-ruby/tzinfo-2.0.5
~dev-ruby/tzinfo-data-1.2022.4
~dev-ruby/unf-0.1.4
~dev-ruby/unf_ext-0.0.8.2
~dev-ruby/unicode-display_width-2.3.0
~dev-ruby/uniform_notifier-1.16.0
~dev-ruby/validate_email-0.1.6
~dev-ruby/validate_url-1.0.15
~dev-ruby/warden-1.2.9
~dev-ruby/webauthn-2.5.2
~dev-ruby/webfinger-1.2.0
~dev-ruby/webmock-3.18.1
~dev-ruby/webpacker-5.4.3
~dev-ruby/websocket-driver-0.7.5
~dev-ruby/websocket-extensions-0.1.5
~dev-ruby/wisper-2.0.1
~dev-ruby/xorcist-1.1.3
~dev-ruby/xpath-3.2.0
~dev-ruby/zeitwerk-2.6.0
~www-servers/puma-5.6.5
"

RUBY_S="${PN}-${PV/_/}"

all_ruby_compile() {
	#yarn install --offline --pure-lockfile || die "yarn install"
	NODE_ENV=production RAILS_ENV=production OTP_SECRET=precompile SECRET_KEY_BASE=precompile \
		rake assets:precompile || die "Unable to precompile assets"
}

all_ruby_install() {
	rm -r node_modules || die

	insinto /usr/share/mastodon
	doins -r .

	systemd_dounit "${FILESDIR}/mastodon.target"
	systemd_dounit "${FILESDIR}/mastodon.service"
	systemd_dounit "${FILESDIR}/mastodon-migrate.service"
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
