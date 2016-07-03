#!/bin/bash -x
MIRROR="/var/cache/usr"
TARGETS=(
	".config"
	".cache"
)
if [ -n "$SUDO_USER" ]; then
	USER=$SUDO_USER
fi

mkdir -p $MIRROR
chmod a+rw $MIRROR
mkdir $MIRROR/$USER

for name in ${TARGETS[@]}; do
	echo "copy $HOME/$name to $MIRROR/$USER/$name"
	mv $HOME/$name $MIRROR/$USER/$name
	ln -s $MIRROR/$USER/$name $HOME/$name
	chown -h $USER:$USER $HOME/$name
done
