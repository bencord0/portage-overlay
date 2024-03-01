# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd unpacker

DESCRIPTION="Jumpcloud Agent"
HOMEPAGE="https://console.jumpcloud.com/"
SRC_URI="https://cdn02.jumpcloud.com/production/versions/${PN}/jcagent-ubuntu-20.04-x86_64.deb ->  ${P}.amd64.deb"
S="${WORKDIR}"

LICENSE="Jumpcloud"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
BDEPEND=""
RDEPEND=""

RESTRICT="fetch"

src_fetch() {
	# Retrieve the connect key from the jumpcloud console, and click "generate command".
	# The value will be set on the X-Connect-Key header.
	# CONNECT_KEY=...
	source /etc/jumpcloud-connect.conf

	wget -O "${DISTDIR}/${P}.amd64.deb" "https://cdn02.jumpcloud.com/production/versions/${PN}/jcagent-ubuntu-20.04-x86_64.deb"
	curl --tlsv1.2 --silent --show-error --fail \
		--header X-Connect-Key: "${CONNECT_KEY}" \
		--output "${P}.amd64.deb" \
		"https://cdn02.jumpcloud.com/production/versions/${PN}/jcagent-ubuntu-20.04-x86_64.deb"
}

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	source /etc/jumpcloud-connect.conf
	cat <<-EOF > opt/jc/agentBootstrap.json
		{
			"publicKickstartUrl": "https://kickstart.jumpcloud.com",
			"privateKickstartUrl": "https://private-kickstart.jumpcloud.com",
			"connectKey": "${CONNECT_KEY}"
		}
	EOF

	mkdir -pv "${D}/opt/jc"
	cp -av ./opt/jc "${D}/opt/"
	systemd_dounit ./lib/systemd/system/jcagent.service

	#insinto /etc/...
	#insopts -m 640
	#doins etc/cron.d/jumpcloud-updater

	insinto /opt/jc
	doins "${FILESDIR}/ca.crt"
}
