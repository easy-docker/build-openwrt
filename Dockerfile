FROM ubuntu:bionic

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

RUN apt update \
 && apt-get install -yyq build-essential git gawk unzip python2.7 libncurses5-dev wget vim \
 && useradd op -m -s /bin/bash

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
 && cp /home/op/config .config
 
RUN cd \
 && cd openwrt \
 && make V=s

USER root
ADD start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]