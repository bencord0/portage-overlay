#!/bin/bash

set -ex

ZPOOL="zpool"
MACHINE="${1}"

systemctl stop "systemd-nspawn@${MACHINE}.service"
fuser -mk "/var/lib/machines/${MACHINE}" || true
zfs umount "${ZPOOL}/machines/${MACHINE}"
