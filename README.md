# docker-build-openwrt

此处默认编译的是openwrt18.06需要其他版本可以切换branch
下载好会自带youkukl1的成品刷机包.

---
# 使用方法
```
docker run -d -v /data/openwrt:/data --restart=always --name op ghostry/build-openwrt
docker exec -it op bash
su op
cd
cd openwrt
git branch
git pull
./scripts/feeds update -a && ./scripts/feeds install -a
make menuconfig
#选择需要的内容,然后
make V=s
mv bin/targets/ramips/mt7620/openwrt-ramips-mt7620-youku-yk1-squashfs-sysupgrade.bin /data/
```
