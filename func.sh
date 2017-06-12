#!/bin/bash
#

# The assumption is made that the del_stopped function is defined.
# See for an example of the files.

firefox-dev(){
  #if [[ -v "$DOCKER_REPO_PREFIX" ]]; then
    local DOCKER_REPO_PREFIX=vidbina # TODO retrieve prefix 
  #fi

  local app_name=firefox-dev

	del_stopped ${app_name}

	docker run -d \
		--memory 2gb \
		--net host \
		--cpuset-cpus 0 \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v "${HOME}/.firefox/cache:/root/.cache/mozilla" \
		-v "${HOME}/.firefox/mozilla:/root/.mozilla" \
		-v "${HOME}/Downloads:/root/Downloads" \
		-v "${HOME}/Pictures:/root/Pictures" \
		-v "${HOME}/Torrents:/root/Torrents" \
		-e "DISPLAY=unix${DISPLAY}" \
		-e GDK_SCALE \
		-e GDK_DPI_SCALE \
		--device /dev/snd \
		--device /dev/dri \
		--name ${app_name} \
		${DOCKER_REPO_PREFIX}/${app_name} "$@"

	# exit current shell
	exit 0
}
