#!/bin/bash -x
$CONFIG=/var/config
if [ -n "$SUDO_USER" ]; then
	USER=$SUDO_USER
fi

echo "create $CONFIG for user config directory"
mkdir -p $CONFIG
chmod a+rw $CONFIG

echo "move $HOME/$name to $MIRROR/$USER/$name"
mv $HOME/.config $CONFIG/$USER
ln -nfs $CONFIG/$USER $HOME/.config
