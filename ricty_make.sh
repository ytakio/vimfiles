#!/bin/sh -x
mkdir Ricty
#git clone git://github.com/yascentur/Ricty.git
cd Ricty
wget http://www.rs.tus.ac.jp/yyusa/ricty/ricty_generator.sh; chmod a+x ricty_generator.sh
wget --content-disposition https://github.com/google/fonts/blob/master/ofl/inconsolata/Inconsolata-Bold.ttf?raw=true
wget --content-disposition https://github.com/google/fonts/blob/master/ofl/inconsolata/Inconsolata-Regular.ttf?raw=true
wget http://osdn.dl.osdn.jp/mix-mplus-ipa/63545/migu-1m-20150712.zip
unzip migu-1m-20150712.zip
mv migu-1m-20150712/* ./

./ricty_generator.sh auto

mkdir -p /usr/share/fonts/truetype/ricty
mv Ricty*.ttf /usr/share/fonts/truetype/ricty/
fc-cache -fv

cd ../
rm -rf Ricty/

