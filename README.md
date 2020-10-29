# docker-build-openwrt

此处默认编译的是openwrt18.06需要其他版本可以切换branch

---
# 使用方法
```
docker pull ghostry/build-openwrt:WSC
docker stop gbuildopenwrt
docker rm gbuildopenwrt
mkdir -p ~/openwrt
chmod 777 ~/openwrt
docker run -d -v ~/openwrt:/data --name gbuildopenwrt ghostry/build-openwrt:WSC
docker exec -it gbuildopenwrt bash
./linux.sh  #Linux可以移动build_dir,staging_dir到主机,Mac不能,会出错
./update.sh
make menuconfig
#选择需要的内容,然后
./make.sh
```
如果是某个机器专用的固件，
可以解包备份的配置文件到`~/openwrt/files`目录下，
这样编译出的固件将会带有配置，实现刷机后0配置。
