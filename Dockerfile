FROM ubuntu:bionic

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

RUN apt update \
 && apt-get install -yyq build-essential git gawk unzip python2.7 libncurses5-dev wget vim \
 && useradd op -m -s /bin/bash \
 && su op \
 && cd \
 && git clone --depth 1 https://github.com/openwrt/openwrt.git \
 && cd openwrt \
 && git config remote.origin.fetch '+refs/heads/openwrt-18.06:refs/remotes/origin/openwrt-18.06' \
 && git pull \
 && git checkout openwrt-18.06 \
 && git branch \
 && ./scripts/feeds update -a && ./scripts/feeds install -a 

ADD config /home/config

RUN su op \
 && cd
 && cd openwrt \
 && cp ../../config .config \
 && make V=s

CMD ["/bin/bash -c 'while true;do sleep 3600;done'"]