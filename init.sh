#!/bin/bash

HOME=~

mkdir -p $HOME/.config
mkdir -p $HOME/src/bin
mkdir -p $HOME/downloads

mkdir -p $HOME/src/go
mkdir -p $HOME/go
mkdir -p $HOME/.cargo/bin
	

sudo apt-get update
sudo apt-get install binutils fish tmux

configure_fish() {
	sudo usermod -s /usr/bin/fish pentecostjonathan
	curl -L https://get.oh-my.fish | fish
}

ssh_keygen() {
	ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "pentecostjonathan@gmail.com"
}

install_gcloud() {
	curl https://sdk.cloud.google.com | bash
}

install_go() {
	pushd $HOME/downloads
	GOVERSION=1.12.1
	GOARCHIVE=go$GOVERSION.linux-amd64.tar.gz
	rm $GOARCHIVE
	wget https://dl.google.com/go/$GOARCHIVE
	tar -xzf $GOARCHIVE -C $HOME/src
	popd

	ln -s $HOME/src/go/bin/go $HOME/src/bin/go
	ln -s $HOME/src/go/bin/gofmt $HOME/src/bin/gofmt
	ln -s $HOME/src/go/bin/godoc $HOME/src/bin/godoc
}

install_dotfiles() {
	pushd $HOME/src
	if [ -d "dotfiles" ]; then
		pushd dotfiles
		git pull origin master
		popd
	else
		git clone https://github.com/vishen/dotfiles.git
	fi
	popd
	
	pushd $HOME/src/dotfiles
	./install.sh
	popd
}

install_pacm() {
	$HOME/src/bin/go get -u github.com/vishen/pacm
}

#configure_fish
# install_go
# install_dotfiles
#install_pacm
install_gcloud

