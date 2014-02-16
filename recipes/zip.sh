#!/bin/sh

root=$(pwd)
zip_url="http://hivelocity.dl.sourceforge.net/project/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz"
unzip_url="http://hivelocity.dl.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz"

echo "Download Info-ZIP Zip 3.0..."
curl $zip_url -s -o - | tar xzf - -C .
cd zip30

echo "Compiling Zip..."
make -f unix/Makefile generic

cd $root

echo "Downloading Info-ZIP UnZip 6.0..."
curl $unzip_url -s -o - | tar xzf - -C .
cd unzip60

echo "Compiling UnZip..."
make -f unix/Makefile generic

cd $root
cp zip30/{zip,zipcloak,zipnote,zipsplit} .
cp unzip60/{funzip,unzip,unzipsfx} .
rm -fr zip30 unzip60
