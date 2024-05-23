#!/bin/bash

_url=https://gitlab.archlinux.org/archlinux/packaging/packages
_file=../plasma.list
tag=5.27.10-1

mkdir -p plasma
cd plasma

for f in $(cat ${_file}); do
    [[ ! -d $f ]] && [[ ! -d ${f%-git} ]] && \
      git clone --depth 1 --branch $tag ${_url}/${f}.git || echo "$f already exists; skipping."
done
