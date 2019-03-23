# docker-build-openwrt

此处默认编译的是openwrt18.06需要其他版本可以切换branch

---
# 使用方法
```
docker pull ghostry/build-openwrt
docker run -d -v /data/openwrt:/data --name gbuildopenwrt ghostry/build-openwrt
docker exec -it gbuildopenwrt bash
su op
git branch
git pull
./scripts/feeds update -a && ./scripts/feeds install -a
make menuconfig
#选择需要的内容,然后
make V=s
```
