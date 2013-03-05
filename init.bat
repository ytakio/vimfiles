PATH=C:\Program Files (x86)\Git\bin;%PATH%
mkdir %HOMEPATH%\.vim\bundle
cd %HOMEPATH%\.vim\bundle
git clone git://github.com/Shougo/neobundle.vim.git
cd neobundle.vim
git checkout ver.2.1

