# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION="AWS SSM Session Manager Plugin"
HOMEPAGE="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html"
SRC_URI="https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm -> ${P}.rpm"

LICENSE="AWS-SSM-PLUGIN"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

QA_PREBUILT="/usr/bin/session-manager-plugin"

src_unpack() {
	rpm_unpack ${A}
	cd "${S}"
}

src_install() {
	dobin usr/local/sessionmanagerplugin/bin/session-manager-plugin
	dodoc usr/local/sessionmanagerplugin/VERSION
	dodoc usr/local/sessionmanagerplugin/LICENSE

	keepdir /var/lib/amazon/sessionmanagerplugin
}
