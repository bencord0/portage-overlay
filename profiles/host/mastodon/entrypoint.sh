#!/bin/bash

OVERLAY_BASE=/var/db/repos/bencord0/profiles/host/mastodon
cp -v "${OVERLAY_BASE}/docker-context/locale.gen" /etc/locale.gen
cp -v "${OVERLAY_BASE}/docker-context/make.conf" /etc/portage/make.conf
cp -v "${OVERLAY_BASE}/docker-context/repos.conf" /etc/portage/repos.conf

eselect profile set bencord0:host/mastodon
exec bash
