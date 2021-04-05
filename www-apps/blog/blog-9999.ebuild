# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
inherit distutils-r1

DESCRIPTION="Blog engine behind blog.condi.me"
HOMEPAGE="https://blog.condi.me/"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bencord0/blog.git"
else
	SRC_URI="https://github.com/bencord0/blog/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
fi

LICENSE="MIT"
SLOT="0"

DISTUTILS_USE_SETUPTOOLS=rdepend
RDEPEND="
	dev-python/arrow[${PYTHON_USEDEP}]
	dev-python/dj-database-url[${PYTHON_USEDEP}]
	dev-python/django[${PYTHON_USEDEP}]
	dev-python/django-debug-toolbar[${PYTHON_USEDEP}]
	dev-python/django-jinja[${PYTHON_USEDEP}]
	dev-python/djangorestframework[${PYTHON_USEDEP}]
	dev-python/graphene[${PYTHON_USEDEP}]
	dev-python/graphene-django[${PYTHON_USEDEP}]
	dev-python/httptools[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/markdown[${PYTHON_USEDEP}]
	dev-python/psycopg[${PYTHON_USEDEP}]
	dev-python/sentry-sdk[${PYTHON_USEDEP}]
	dev-python/uvicorn[${PYTHON_USEDEP}]
	dev-python/uvloop[${PYTHON_USEDEP}]
	dev-python/whitenoise[${PYTHON_USEDEP}]
	www-servers/gunicorn[${PYTHON_USEDEP}]
"
