FROM ubuntu:bionic

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

RUN apt update \
 && apt-get install -yyq build-essential git gawk unzip python2.7 libncurses5-dev wget vim \
 && useradd op -m -s /bin/bash && mkdir /data && chmod 777 /data

ADD config /home/op/config

RUN chmod 777 /home/op/config

USER op

RUN cd \
 && git clone --depth 1 https://github.com/openwrt/openwrt.git \
 && cd openwrt \
 && git config remote.origin.fetch '+refs/heads/openwrt-18.06:refs/remotes/origin/openwrt-18.06' \
 && git pull \
 && git checkout openwrt-18.06 \
 && git branch \
 && ./scripts/feeds update -a && ./scripts/feeds install -a \
 && mv /home/op/config .config \
 && ln -s /data bin

ADD dl /home/op/openwrt/dl

WORKDIR /home/op/openwrt

USER root
ADD start.sh /start.sh
RUN chmod +x /start.sh

VOLUME ["/data"]

CMD ["/start.sh"]