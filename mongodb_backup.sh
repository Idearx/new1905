#!/bin/bash

# CopyRighty By Yan Yalun~

echo "Test Begin"

mongodump -h 127.0.0.1 -d $1 -o $2

echo "备份完成！"

echo "压缩开始"

tar -zcvf "$1.tar.gz" $1

echo "压缩完成"

# echo "当前时间为："`date +%Y-%m-%d %H:%M:%S`

echo "当前时间为："`date +%Y-%m-%d`

time=`date +%Y-%m-%d`
echo "$time"

cp "$1.tar.gz" ./"mongodb-$time.tgz"

echo "改名成功！"

function makedir()
{
    echo "创建文件夹"
    echo "dadasd"
    echo $1
    orname=$1
    len=${#orname}
    name=${orname:2:len}
    echo "$name";
    mkdir $name;
}

if [ -e $3 ]; then
    echo "文件夹存在"
    mv ./"mongodb-$time.tgz" $3;
else
    echo "文件夹不在"
    makedir "$3";
    mv ./"mongodb-$time.tgz" $3;
fi
cd $3
if [ -e "mongodb-$time.tgz" ]; then
    echo "文件存在!"
    echo "成功备份，并且文件成功拷贝！" >> log.txt
else
    echo "文件不存在！"
    echo "备份失败！" >> log.txt
fi
cd ..
echo "成功的次数：" 
cat $3/log.txt | sort | grep -E '成功+' | wc -l
echo "失败的次数：" 
cat $3/log.txt | sort | grep -E '+失败' | wc -l
