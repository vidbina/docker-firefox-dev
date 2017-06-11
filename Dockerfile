FROM debian:sid
LABEL maintainer "David Asabina <vid@bina.me>"

ARG FIREFOX_TAR_URI

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
