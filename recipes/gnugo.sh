#!/bin/sh

root=$(pwd)

echo "Downloading GNU Go 3.8..."
curl http://mirrors.kernel.org/gnu/gnugo/gnugo-3.8.tar.gz -s -o - | tar xzf - -C .
cd gnugo-*

echo "Compiling..."
./configure
make

cd $root
cp gnugo-*/interface/gnugo .
rm -fr gnugo-*
