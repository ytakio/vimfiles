#!/bin/sh -x
git clone git://github.com/yascentur/Ricty.git
cd Ricty
wget http://levien.com/type/myfonts/Inconsolata.otf
wget http://iij.dl.sourceforge.jp/mix-mplus-ipa/59022/migu-1m-20130617.zip
unzip migu-1m-20130617.zip
mv migu-1m-20130617/* ./

./ricty_generator.sh Inconsolata.otf migu-1m-regular.ttf migu-1m-bold.ttf

mkdir -p /usr/share/fonts/truetype/ricty
mv Ricty*.ttf /usr/share/fonts/truetype/ricty/
fc-cache -fv

cd ../
rm -rf Ricty/

