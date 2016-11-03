#!/bin/bash
ECHO=echo
if [ -n "${SUDO_USER}" ]; then
	USER=${SUDO_USER}
else
	echo "sudo init_galliumOS_settings.sh"
	exit 1
fi

mirror_and_link() {
	NUMBER=$1
	TARGET=$2
	MIRROR=$3
	echo "${NUMBER}. mirroring ${TARGET} to ${MIRROR}"
	echo "${NUMBER}.1. create ${MIRROR} for user config directory"
	$ECHO mkdir -p ${MIRROR}

	echo "${NUMBER}.2. move and link ${HOME}/${TARGET} to ${MIRROR}/${USER}"
	$ECHO mv ${HOME}/${TARGET} ${MIRROR}/${USER}
	$ECHO ln -nfs ${MIRROR}/${USER} ${HOME}/${TARGET}
}

mirror_and_link 1 .config /var/config
mirror_and_link 2 .cache /cache
