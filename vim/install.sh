#!/bin/bash
startdir="$1/pack/my-plugins/start"
mkdir -p $startdir

git_clone_or_pull() {
    dir=$startdir/$(basename "$1")
    echo $dir && [ -d "$dir" ] && git -C "$dir" pull || git clone "$1" "$dir" &
}

cat "$1/package-list" | while read package ; do
    git_clone_or_pull $package
done
wait
echo parallel update repos complete
