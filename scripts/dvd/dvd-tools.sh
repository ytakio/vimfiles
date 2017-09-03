#!/bin/sh
DIRNAME=`date +%m%d_%H%M%S`

if [ $# -eq 1 ]; then
	DIRNAME=$1
fi

time dvdbackup -M -o ${DIRNAME}
genisoimage -dvd-video -udf -o "${DIRNAME}/dvd.iso" "`ls -d ./${DIRNAME}/*`"
eject
echo -n "please insert Next disk and hit [Enter] or 'q' to quiet: "
echo read q
echo "If you want to burn dvd, please command in the following."
echo "\tgrowisofs -dvd-compat -Z /dev/dvd=${DIRNAME}/dvd.iso"
