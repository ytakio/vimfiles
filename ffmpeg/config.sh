#!/bin/bash -x
PKG_CONFIG_PATH="${PKG_CONFIG_PATH}" \
	./configure \
	--prefix="${PREFIX}" \
	--pkg-config-flags="--static" \
	--enable-shared \
	--enable-pic \
	--enable-gpl \
	--enable-gnutls \
	--enable-libzmq \
	--enable-libaom \
	--enable-libass \
	--enable-libfdk-aac \
	--enable-libfreetype \
	--enable-libmp3lame \
	--enable-libopus \
	--enable-libvorbis \
	--enable-libvpx \
	--enable-libx264 \
	--enable-libx265 \
	--enable-librav1e \
	--enable-libdav1d \
	--enable-nonfree