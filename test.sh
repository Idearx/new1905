#!/bin/bash

# this is a test script.

# author: yanyalun20190628 AT beijing.

# Alarm: this script will bomeo.

# https://download.oracle.com/otn/java/jdk/8u211-b12/478a62b7d4e34b78b671c754eaaf38ab/jdk-8u211-linux-x64.tar.gz

function usage {
  echo "Usage: $0 username."
  exit 1
}

if [ $# -lt 2 ]; then
    usage;
fi

current_day=`date +%Y%m%d-%H%M`

folder="cccdddeeefff"

echo "folder:${folder}"
echo "folder len: ${#folder}"
echo "sub folder: ${folder:3:4}"

echo "hello $1,$current_day"
echo "param numbers: $#"
echo "params: $*"
echo "create folder"

mkdir -p aaa/bbb/${folder}

cd aaa/bbb/$folder

pwd

for i in `seq 5`; do 
    mkdir -p 5; 
done
