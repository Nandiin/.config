#!/bin/sh

BASE=$(cd "$(dirname "$0")" && pwd)

leaves=($(find "$BASE" -type f \
	-not -path "$BASE/.git/*" \
	-not -name .gitignore \
	-not -name install.sh \
	-not -name README.md \
	))

destinations=($(echo "${leaves[@]}" \
	| sed -e "s?$BASE/?$HOME/?g"))

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

for i in $(seq 0 `expr ${#destinations[@]} - 1`)
do
	dst="${destinations[$i]}"
	src="${leaves[$i]}"
  	remove_if_exists "$dst"
  	mkdir_if_not_exists $(dirname $dst)
  	ln -s $src $dst
done
