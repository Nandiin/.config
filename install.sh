#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
color_green="\033[32m"
color_yellow="\033[33m"
color_reset="\033[0m"

function remove_if_exists() {
	if [ -f $1 ] || [ -L $1 ]; then
		rm $1
		echo -e "${bold}Removed${normal} $1"
	fi
}

function mkdir_if_not_exists() {
	if [ ! -d $1 ]; then
		mkdir -p $1
	fi
}

function link() {
	# usage: link <source paths> <destination paths>
	#  - <source paths>: relative to directory of this script file.
	#  - <destination paths>: relative to $HOME
	args=($*)
	len=`expr $# / 2`
	sources=("${args[@]:0:$len}")
	destinations=("${args[@]:$len:$len}")

	max=`expr $len - 1`

	for i in $(seq 0 $max)
	do
		echo "--------------------------------------------------"
		src="$base/${sources[$i]}"
		dst="$HOME/${destinations[$i]}"
		remove_if_exists "$dst"
		mkdir_if_not_exists $(dirname $dst)
		ln -s $src $dst
		echo -e "${bold}Linked${normal} $color_yellow$src$color_reset"
		echo -e "    ${bold}to${normal} $color_green$dst$color_reset"
	done
}

base=$(cd "$(dirname "$0")" && pwd)

leaves=($(find "$base" -type f \
	-not -path "$base/.git/*" \
	-not -path "$base/.config/nvim/*" \
	-not -name .gitignore \
	-not -name install.sh \
	-not -name README.md \
	-not -name "*.swp"
))
		
destinations=($(echo "${leaves[@]}" | sed -e "s?$base/??g"))

# sources has same relative path with destinations
link "${destinations[@]}" " ${destinations[@]}"

# nvim

nvim_leaves=($(find "$base/.config/nvim" -type f \
	-not -name "*.swp"
))

nvim_destinations=($(echo "${nvim_leaves[@]}" | sed -e "s?$base/??g"))

nvim_sources=($(cat "${nvim_leaves[@]}"))

link "${nvim_sources[@]}" "${nvim_destinations[@]}"
