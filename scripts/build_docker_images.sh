#!/bin/bash

set -ex

docker pull alpine:3.11
docker pull busybox:latest
docker pull gentoo/portage
docker pull gentoo/stage3:amd64-systemd

docker build -t ghcr.io/bencord0/portage-overlay:master -f Dockerfile .
docker build -t mastodon -f profiles/host/mastodon/Dockerfile profiles/host/mastodon/docker-context/
