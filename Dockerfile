FROM debian:sid
LABEL maintainer "David Asabina <vid@bina.me>"

ARG FIREFOX_TAR_URI=https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora/firefox-54.0a2.en-US.linux-x86_64.tar.bz2

RUN set -x \
  && apt-get update && apt-get install -y \
    bzip2 \
    curl \
    firefox \
  && curl -sSL ${FIREFOX_TAR_URI} -o /tmp/firefox-dev.tar.bz2 \
  && echo "7b705577f468a11a91bbc3bc8a31097f10cf79afd21388dce25b6d3a729a95a0f5473de2e051624aebc89b15e25b11c56a132d1482f0c360f8a1cb1005f69b2d /tmp/firefox-dev.tar.bz2" | sha512sum -c - \
  && mkdir -p /tmp/firefox-dev \
  && tar -xjf /tmp/firefox-dev.tar.bz2 -C /tmp/firefox-dev

ENV LANG en-US
ENTRYPOINT [ "/tmp/firefox-dev/firefox/firefox" ]
