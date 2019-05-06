#!/bin/sh
cd /home/op/openwrt
if [ ! -L dl ];then
    mkdir -p /data/dl
    ln -s /data/dl ./
    chmod 777 /data/dl
    mkdir -p /data/bin
    ln -s /data/bin ./
    chmod 777 /data/bin
    chmod 777 /data
fi
if [ ! -f .config ];then
    cp -n /home/op/config .config
    cp -n /home/op/*.sh ./
    chmod 777 .config
    chmod 777 ./*.sh
fi
while true;do sleep 3600;done
