FROM docker.io/library/alpine as builder
WORKDIR /overlay

ARG OVERLAY_NAME=bencord0
COPY . "var/db/repos/${OVERLAY_NAME}"

FROM docker.io/library/busybox
WORKDIR /

COPY --from=builder /overlay /
CMD /bin/true
VOLUME /var/db/repos/${OVERLAY_NAME}
