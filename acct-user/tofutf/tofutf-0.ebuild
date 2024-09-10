# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION=""
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( tofutf )
ACCT_USER_HOME=/var/lib/terraform

acct-user_add_deps
