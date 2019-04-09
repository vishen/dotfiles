#!/bin/bash

if [ ! -d "~/.cache/dein" ]; then
		curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
		sh ./installer.sh ~/.cache/dein &> /dev/null
		rm ./installer.sh
fi

mkdir -p ~/.config/pacm
mkdir -p ~/.config/fish
mkdir -p ~/src/bin/pacmbin

cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
cp gitconfig ~/.gitconfig
cp pacmconfig ~/.config/pacm/config
cp -r fish ~/.config/
