# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="user for kine"
ACCT_USER_ID=92
ACCT_USER_GROUPS=( kine )

acct-user_add_deps
