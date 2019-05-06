#!/bin/sh
mkdir -p /data/build_dir
ln -s /data/build_dir ./
mv -f /home/op/openwrt/staging_dir /data/staging_dir
rm -rf /home/op/openwrt/staging_dir
mkdir -p /data/staging_dir
ln -s /data/staging_dir ./