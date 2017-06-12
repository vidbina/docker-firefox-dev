FROM debian:sid
LABEL maintainer "David Asabina <vid@bina.me>"

ARG FIREFOX_TAR_URI=https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora/firefox-54.0a2.en-US.linux-x86_64.tar.bz2

RUN set -x \
  && apt-get update && apt-get install -y \
    bzip2 \
    curl \
    firefox \
  && curl -sSL ${FIREFOX_TAR_URI} -o /tmp/firefox-dev.tar.bz2 \
  && mkdir -p /tmp/firefox-dev \
  && tar -xjf /tmp/firefox-dev.tar.bz2 -C /tmp/firefox-dev

ENV LANG en-US
ENTRYPOINT [ "/tmp/firefox-dev/firefox/firefox" ]
