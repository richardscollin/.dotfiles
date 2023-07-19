#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Invalid number of arguments"
    echo "Typical usage: ~/.vim/install.sh ~/.vim"
    exit 1
fi

startdir="$1/pack/my-plugins/start"
echo "Updating vim plugins in ${startdir}"
mkdir -p "${startdir}" ~/.local/state/vim
cd "${startdir}"
cat "$1/package-list" | xargs -n 1 -P 0 github-clone-or-pull
