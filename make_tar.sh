#!/bin/sh

OUT=TC-controller-3A4C.tar.bz2
VERSION=1.6.12

VERSION_ESC=$(echo $VERSION | sed "s/\./\\\./g")

cd $(dirname "$0")

find . -name ".DS_Store" -delete
rm -rf $OUT $VERSION
mkdir -p $VERSION
ln -s $(ls -d $PWD/* | sed -e "/$VERSION_ESC/d" -e "/package_index\.json/d" -e "/make_tar.sh/d") $VERSION 
tar -cHjf $OUT $VERSION/*
rm -r $VERSION
shasum -a 256 $OUT
wc -c $OUT
