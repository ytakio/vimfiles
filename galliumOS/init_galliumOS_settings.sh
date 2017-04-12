#!/bin/bash
ECHO=echo
if [ -n "${SUDO_USER}" ]; then
	USER=${SUDO_USER}
	echo "---------------"
	echo "run for ${USER}"
	echo "---------------"
else
	echo "sudo init_galliumOS_settings.sh"
	exit 1
fi

mirror_and_link() {
	NUMBER=$1
	TARGET=$2
	MIRROR=$3
	echo "# ${NUMBER}. mirroring ${TARGET} to ${MIRROR}"
	echo "## ${NUMBER}.1. create ${MIRROR} for user config directory"
	$ECHO mkdir -p ${MIRROR}
	$ECHO chmod a+rw ${MIRROR}

	echo "## ${NUMBER}.2. move and link ${HOME}/${TARGET} to ${MIRROR}"
	$ECHO mv ${HOME}/${TARGET}/* ${MIRROR}
	$ECHO rm -rf ${HOME}/${TARGET}
	$ECHO ln -nfs ${MIRROR} ${HOME}/${TARGET}
}

mirror_and_link 1 .config /var/config/takio
mirror_and_link 2 .cache /cache/takio

echo "# replace rc.local"
$ECHO mv /etc/rc.local /etc/rc.local.old
$ECHO cp `dirname $0`/rc.local /etc/
