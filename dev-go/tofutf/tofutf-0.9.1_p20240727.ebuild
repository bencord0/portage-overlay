# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

EGO_SRC=github.com/tofutf/tofutf
EGO_PN=${EGO_SRC}
#EGIT_COMMIT="v${PV}"
EGIT_COMMIT="50fb617b9eae975e09af450aa348763c81b323f7"

DESCRIPTION="An open source alternative to Terraform Enterprise"
HOMEPAGE="https://docs.tofutf.io/"
SRC_URI="
	https://github.com/tofutf/tofutf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://dl.condi.me/distfiles/${PN}-${EGIT_COMMIT}-vendor.tar.xz
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/go"

S="${WORKDIR}/${PN}-${EGIT_COMMIT}"

src_compile() {
	ego build ./cmd/tofutfd
	ego build ./cmd/tofutf
	ego build ./cmd/tofutf-agent
}

src_install() {
	dobin tofutfd tofutf tofutf-agent

	systemd_dounit "${FILESDIR}"/tofutfd.service

	cd "${T}"
	cat > env << EOF
OTF_HOSTNAME=""
OTF_DATABASE=""
OTF_SECRET=""
OTF_SITE_TOKEN=""
OTF_SITE_ADMINS=""
OTF_OIDC_NAME=""
OTF_OIDC_ISSUER_URL=""
OTF_OIDC_CLIENT_ID=""
OTF_OIDC_CLIENT_SECRET=""
OTF_OIDC_USERNAME_CLAIM=""
OTF_OIDC_SCOPES=""
EOF
	insinto /etc/tofutf
	insopts -m 600
	doins env
}
