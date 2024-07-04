# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd unpacker

DESCRIPTION="CircleCI Self-Hosted Runner"
HOMEPAGE="https://circleci.com/docs/runner-overview/"
SRC_URI="https://packagecloud.io/circleci/runner/packages/any/any/circleci-runner_${PV}_amd64.deb/download.deb ->  ${P}.amd64.deb"
S="${WORKDIR}"

LICENSE="CircleCI"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
BDEPEND=""
RDEPEND="
	acct-user/circleci
	acct-group/circleci
"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	dobin usr/bin/circleci-runner
	systemd_dounit usr/lib/systemd/system/circleci-runner.service

	insinto /etc/circleci-runner
	insopts -m 640
	doins etc/circleci-runner/circleci-runner-config.yaml

	keepdir /var/lib/circleci-runner

	dodoc usr/share/doc/circleci-runner/copyright
}
