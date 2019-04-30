#!/bin/bash

HOME=~

mkdir -p $HOME/.config
mkdir -p $HOME/src/bin
mkdir -p $HOME/downloads
mkdir -p $HOME/installs

mkdir -p $HOME/src/go
mkdir -p $HOME/go
mkdir -p $HOME/.cargo/bin
	

sudo apt-get update
sudo apt-get install binutils fish tmux

install_neovim() {
	NEOVIM_VERSION=0.3.4
	pushd $HOME/downloads 
	wget https://github.com/neovim/neovim/releases/download/v$NEOVIM_VERSION/nvim-linux64.tar.gz
	tar -xzf nvim-linux64.tar.gc -C $HOME/installs
	popd
	ln -s $HOME/installs/nvim-linux64/bin/nvim $HOME/src/bin/nvim
}

install_docker() {
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"
	 > /etc/apt/sources.list

	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io
	sudo usermod -a -G docker $USER 
}

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

install_rust() {
	curl https://sh.rustup.rs -sSf | sh
}

#configure_fish
# install_go
# install_dotfiles
#install_pacm
# install_gcloud

