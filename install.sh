#!/bin/sh

BASE=$(cd "$(dirname "$0")" && pwd)

function remove_if_exists() {
	if [ -f $1 ] || [ -L $1 ]; then
		echo "Removing old config $1"
		rm $1
	fi
}

function mkdir_if_not_exists() {
	if [ ! -d $1 ]; then
		mkdir -p $1
	fi
}

if hash fish 2>/dev/null; then
	remove_if_exists ~/.config/fish/config.fish
	mkdir_if_not_exists ~/.config/fish
	ln -s "$BASE/.config/fish/config.fish" ~/.config/fish/config.fish
fi

if hash git 2>/dev/null; then
	remove_if_exists ~/.gitconfig
	ln -s "$BASE/.gitconfig" ~/.gitconfig
fi

if hash vim 2>/dev/null; then
	remove_if_exists ~/.vimrc
	ln -s "$BASE/.vimrc" ~/.vimrc
	remove_if_exists ~/.vim/deinrc.vim
	mkdir_if_not_exists ~/.vim
	ln -s "$BASE/.vim/deinrc.vim" ~/.vim/deinrc.vim
fi

if hash nvim 2>/dev/null; then
	remove_if_exists ~/.config/nvim/init.vim
	mkdir_if_not_exists ~/.config/nvim
	ln -s ~/.vimrc ~/.config/nvim/init.vim
fi
