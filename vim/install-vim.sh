#!/bin/bash

cd $(dirname $BASH_SOURCE)
BASE=$(pwd)

export GIT_SSL_NO_VERIFY=true
mkdir -p ~/.vim/autoload
curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

# vimrc
mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
ln -sf $BASE/vimrc ~/.vimrc
ln -sf $BASE/vim_base ~/.vim_base
ln -sf $BASE/vim_plug ~/.vim_plug
ln -sf $BASE/vim_map ~/.vim_map
ln -snf $BASE/UltiSnips ~/.vim/UltiSnips
ln -sf $BASE/gvimrc ~/.gvimrc

# nvim
mkdir -p ~/.config/nvim/autoload
ln -sf $BASE/vimrc ~/.config/nvim/init.vim
ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/

mkdir -p ~/.config/nvim
ln -sf $BASE/coc-settings.json ~/.config/nvim/coc-settings.json

touch ~/.vim_local

vim +PlugInstall +qall