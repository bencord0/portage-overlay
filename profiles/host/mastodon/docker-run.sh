#!/bin/bash

exec docker run \
    -it --rm \
    -v /var/db/repos/gentoo/:/var/db/repos/gentoo/ \
    -v /var/db/repos/bencord0/:/var/db/repos/bencord0/ \
    gentoo/stage3:amd64-systemd-mergedusr \
    /var/db/repos/bencord0/profiles/host/mastodon/entrypoint.sh
