#!/bin/sh
cd /home/op/openwrt
if [ ! -L dl ];then
    mkdir -p /data/dl
    ln -s /data/dl ./
    mkdir -p /data/bin
    ln -s /data/bin ./
    mkdir -p /data/build_dir
    ln -s /data/build_dir ./
    mv /home/op/openwrt/staging_dir /data/staging_dir
    rm -rf /home/op/openwrt/staging_dir
    mkdir -p /data/staging_dir
    ln -s /data/staging_dir ./
    chmod -R 777 /data
fi
if [ ! -f .config ];then
    cp -n /home/op/config .config
    cp -n /home/op/*.sh ./
    chmod 777 .config
    chmod 777 ./*.sh
fi
while true;do sleep 3600;done
