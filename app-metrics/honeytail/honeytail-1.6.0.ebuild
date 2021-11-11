# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

EGO_SUM=(
    "github.com/DataDog/zstd v1.4.8"
    "github.com/DataDog/zstd v1.4.8/go.mod"
    "github.com/davecgh/go-spew v1.1.0/go.mod"
    "github.com/davecgh/go-spew v1.1.1"
    "github.com/davecgh/go-spew v1.1.1/go.mod"
    "github.com/facebookgo/clock v0.0.0-20150410010913-600d898af40a"
    "github.com/facebookgo/clock v0.0.0-20150410010913-600d898af40a/go.mod"
    "github.com/facebookgo/ensure v0.0.0-20200202191622-63f1cf65ac4c"
    "github.com/facebookgo/ensure v0.0.0-20200202191622-63f1cf65ac4c/go.mod"
    "github.com/facebookgo/limitgroup v0.0.0-20150612190941-6abd8d71ec01"
    "github.com/facebookgo/limitgroup v0.0.0-20150612190941-6abd8d71ec01/go.mod"
    "github.com/facebookgo/muster v0.0.0-20150708232844-fd3d7953fd52"
    "github.com/facebookgo/muster v0.0.0-20150708232844-fd3d7953fd52/go.mod"
    "github.com/facebookgo/stack v0.0.0-20160209184415-751773369052"
    "github.com/facebookgo/stack v0.0.0-20160209184415-751773369052/go.mod"
    "github.com/facebookgo/subset v0.0.0-20200203212716-c811ad88dec4"
    "github.com/facebookgo/subset v0.0.0-20200203212716-c811ad88dec4/go.mod"
    "github.com/fsnotify/fsnotify v1.4.7"
    "github.com/fsnotify/fsnotify v1.4.7/go.mod"
    "github.com/go-sql-driver/mysql v1.6.0"
    "github.com/go-sql-driver/mysql v1.6.0/go.mod"
    "github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1"
    "github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1/go.mod"
    "github.com/honeycombio/dynsampler-go v0.2.1"
    "github.com/honeycombio/dynsampler-go v0.2.1/go.mod"
    "github.com/honeycombio/gonx v1.3.1-0.20171118020637-f9b2468e9ef8"
    "github.com/honeycombio/gonx v1.3.1-0.20171118020637-f9b2468e9ef8/go.mod"
    "github.com/honeycombio/libhoney-go v1.15.6"
    "github.com/honeycombio/libhoney-go v1.15.6/go.mod"
    "github.com/honeycombio/mongodbtools v0.0.0-20201022144302-c92638964ed8"
    "github.com/honeycombio/mongodbtools v0.0.0-20201022144302-c92638964ed8/go.mod"
    "github.com/honeycombio/mysqltools v0.0.1"
    "github.com/honeycombio/mysqltools v0.0.1/go.mod"
    "github.com/honeycombio/sqlparser v0.0.0-20180730202938-aab361df519b"
    "github.com/honeycombio/sqlparser v0.0.0-20180730202938-aab361df519b/go.mod"
    "github.com/honeycombio/urlshaper v0.0.0-20170302202025-2baba9ae5b5f"
    "github.com/honeycombio/urlshaper v0.0.0-20170302202025-2baba9ae5b5f/go.mod"
    "github.com/hpcloud/tail v1.0.1-0.20170814160653-37f427138745"
    "github.com/hpcloud/tail v1.0.1-0.20170814160653-37f427138745/go.mod"
    "github.com/jeromer/syslogparser v0.0.0-20190429161531-5fbaaf06d9e7"
    "github.com/jeromer/syslogparser v0.0.0-20190429161531-5fbaaf06d9e7/go.mod"
    "github.com/jessevdk/go-flags v1.5.0"
    "github.com/jessevdk/go-flags v1.5.0/go.mod"
    "github.com/jtolds/gls v4.20.0+incompatible"
    "github.com/jtolds/gls v4.20.0+incompatible/go.mod"
    "github.com/klauspost/compress v1.13.5/go.mod"
    "github.com/klauspost/compress v1.13.6"
    "github.com/klauspost/compress v1.13.6/go.mod"
    "github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515"
    "github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515/go.mod"
    "github.com/kr/pty v1.1.1/go.mod"
    "github.com/kr/text v0.1.0"
    "github.com/kr/text v0.1.0/go.mod"
    "github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e"
    "github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e/go.mod"
    "github.com/pmezard/go-difflib v1.0.0"
    "github.com/pmezard/go-difflib v1.0.0/go.mod"
    "github.com/sirupsen/logrus v1.8.1"
    "github.com/sirupsen/logrus v1.8.1/go.mod"
    "github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d"
    "github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d/go.mod"
    "github.com/smartystreets/goconvey v1.6.4"
    "github.com/smartystreets/goconvey v1.6.4/go.mod"
    "github.com/stretchr/objx v0.1.0/go.mod"
    "github.com/stretchr/testify v1.2.2/go.mod"
    "github.com/stretchr/testify v1.6.1/go.mod"
    "github.com/stretchr/testify v1.7.0"
    "github.com/stretchr/testify v1.7.0/go.mod"
    "github.com/vmihailenco/msgpack/v5 v5.3.4"
    "github.com/vmihailenco/msgpack/v5 v5.3.4/go.mod"
    "github.com/vmihailenco/tagparser/v2 v2.0.0"
    "github.com/vmihailenco/tagparser/v2 v2.0.0/go.mod"
    "github.com/xwb1989/sqlparser v0.0.0-20180606152119-120387863bf2"
    "github.com/xwb1989/sqlparser v0.0.0-20180606152119-120387863bf2/go.mod"
    "golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
    "golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
    "golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
    "golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
    "golang.org/x/sys v0.0.0-20210320140829-1e4c9ba3b0c4"
    "golang.org/x/sys v0.0.0-20210320140829-1e4c9ba3b0c4/go.mod"
    "golang.org/x/text v0.3.0/go.mod"
    "golang.org/x/tools v0.0.0-20190328211700-ab21143f2384/go.mod"
    "gopkg.in/alexcesaro/statsd.v2 v2.0.0"
    "gopkg.in/alexcesaro/statsd.v2 v2.0.0/go.mod"
    "gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
    "gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f"
    "gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f/go.mod"
    "gopkg.in/fsnotify.v1 v1.4.7"
    "gopkg.in/fsnotify.v1 v1.4.7/go.mod"
    "gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7"
    "gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod"
    "gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c"
    "gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
)

go-module_set_globals

DESCRIPTION="Honeycomb agent for extracting data from logs"
HOMEPAGE="https://honeycomb.io/docs/send-data/agent/"
SRC_URI="https://github.com/honeycombio/honeytail/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="dev-lang/go"
S="${WORKDIR}/${P}"

src_compile() {
	go build -v -x .

	./honeytail --write_default_config > honeytail.conf.example
}

src_install() {
	dobin honeytail

	dodoc honeytail.conf.example
	keepdir /etc/honeytail

	systemd_dounit "${FILESDIR}/honeytail.service"
}
