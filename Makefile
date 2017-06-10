DOCKER=docker
OWNER=vidbina
PROJECT=firefox-dev
IMAGE=${OWNER}/${PROJECT}
FIREFOX_TAR=https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora/firefox-54.0a2.en-US.linux-x86_64.tar.bz2

image:
	${DOCKER} build --build-arg FIREFOX_TAR_URI=${FIREFOX_TAR} -t ${IMAGE} .

shell:
	${DOCKER} run --rm --name ${PROJECT} -it ${IMAGE} /bin/bash
