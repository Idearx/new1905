#!/bin/bash

echo "Test Begin";

# https://pypi.python.org/packages/source/p/pip/pip-1.5.4.tar.gz

echo "开始下载！";

wget -c "$1" -P .

echo "下载完成！"


gzname="$echo "$(find ./ -name '*.gz')""

echo "start"

echo "$gzname"

len="${#gzname}"

echo "$len"

str="${gzname:3:($len-2)}"

echo "$str"

tar -xzvf "$str"

mulu="${str:0:($len-10)}"

# echo "$mulu"
cd ./$mulu

echo "hello!modeify!" >> README.rst

cd ..

tar -czvf new.tar.gz $mulu

echo "end"
