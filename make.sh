#!/bin/bash
if [ ! -L dl ];then
    mkdir -p /data/dl
    ln -s /data/dl ./
    mkdir -p /data/bin
    ln -s /data/bin ./
    mkdir -p /data/build_dir
    ln -s /data/build_dir ./
    mkdir -p /data/staging_dir
    ln -s /data/staging_dir ./
    mkdir -p /data/target
    ln -s /data/target ./
fi
if [ ! -f .config ];then
    cp -n /home/op/config .config
    cp -n /home/op/*.sh ./
fi
if [ -z $1 ];then
    j=1
else
    j=$1
fi
make V=s -j $j
