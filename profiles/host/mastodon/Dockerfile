FROM gentoo/portage AS gentoo
FROM ghcr.io/bencord0/portage-overlay:master AS bencord0
FROM gentoo/stage3:amd64-systemd AS stage3

COPY locale.gen /etc/locale.gen
COPY repos.conf /etc/portage/repos.conf
COPY make.conf /etc/portage/make.conf
COPY binrepos.conf /etc/portage/binrepos.conf

RUN ln -sf \
    /var/db/repos/bencord0/profiles/host/mastodon \
    /etc/portage/make.profile

RUN \
    --mount=type=bind,target=/var/db/repos/gentoo,source=/var/db/repos/gentoo,from=gentoo \
    --mount=type=bind,target=/var/db/repos/bencord0,source=/var/db/repos/bencord0,from=bencord0 \
    --mount=type=cache,target=/var/cache/binpkgs \
    --mount=type=cache,target=/var/cache/distfiles \
    env FEATURES=binpkg-ignore-signature emerge getuto && getuto


RUN \
    --mount=type=bind,target=/var/db/repos/gentoo,source=/var/db/repos/gentoo,from=gentoo \
    --mount=type=bind,target=/var/db/repos/bencord0,source=/var/db/repos/bencord0,from=bencord0 \
    --mount=type=cache,target=/var/cache/binpkgs \
    --mount=type=cache,target=/var/cache/distfiles \
    emerge --verbose --deep --newuse --jobs \
        @system

RUN \
    --mount=type=bind,target=/var/db/repos/gentoo,source=/var/db/repos/gentoo,from=gentoo \
    --mount=type=bind,target=/var/db/repos/bencord0,source=/var/db/repos/bencord0,from=bencord0 \
    --mount=type=cache,target=/var/cache/distfiles \
    rm -rf /var/cache/binpkgs/www-apps && \
        emerge --quiet --deep --newuse @profile

USER mastodon
WORKDIR /usr/share/mastodon
EXPOSE 3000 4000
