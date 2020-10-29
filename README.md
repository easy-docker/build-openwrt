# docker-build-openwrt

提供编译环境

---
# 使用方法
这里以 openwrt-18.06 为例
```
docker pull ghostry/build-openwrt
docker rm -f gbuildopenwrt
mkdir -p ~/openwrt
chmod 777 ~/openwrt
docker run -d -v ~/openwrt:/data --name gbuildopenwrt ghostry/build-openwrt
docker exec -it gbuildopenwrt bash
git clone -b openwrt-18.06 --depth 1 https://github.com/openwrt/openwrt.git openwrt-18.06
cd openwrt-18.06
echo 'src-git gmod https://github.com/ghostry/openwrt-gmod;openwrt-18.06' >> feeds.conf.default
cp /home/op/*.sh ./
./update.sh
make menuconfig
#选择需要的内容,然后
./make.sh
```
如果是某个机器专用的固件，
可以解包备份的配置文件到`~/openwrt/openwrt-18.06/files`目录下，
这样编译出的固件将会带有配置，实现刷机后0配置。
