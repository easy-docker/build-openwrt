FROM ubuntu:bionic

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt upgrade -yyq \
    && apt-get install -yyq build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint vim wget bash-completion \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd op -m -s /bin/bash \
    && mkdir /data \
    && chmod 777 /data

ADD config /home/op/config
ADD update.sh /home/op/update.sh
ADD make.sh /home/op/make.sh
ADD linux.sh /home/op/linux.sh
ADD start.sh /start.sh
RUN chmod 777 /home/op/config \
    && chmod 777 /home/op/*.sh \
    && chmod 755 /start.sh

USER op

RUN cd \
    && git clone --depth 1 https://github.com/openwrt/openwrt.git \
    && cd openwrt \
    && git config remote.origin.fetch '+refs/heads/openwrt-18.06:refs/remotes/origin/openwrt-18.06' \
    && git pull \
    && git checkout openwrt-18.06 \
    && git branch \
    && echo 'src-git gmod https://github.com/ghostry/openwrt-gmod;openwrt-18.06' >> feeds.conf.default \
    && ./scripts/feeds update -a && ./scripts/feeds install -a \
    && cp /home/op/*.sh ./

WORKDIR /home/op/openwrt

VOLUME ["/data"]

CMD ["/start.sh"]
