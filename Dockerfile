FROM alpine:3.11 as builder
WORKDIR /overlay

ARG OVERLAY_NAME=bencord0
COPY . "var/db/repos/${OVERLAY_NAME}"

FROM busybox:latest
WORKDIR /

COPY --from=builder /overlay /
CMD /bin/true
VOLUME /var/db/repos/${OVERLAY_NAME}
