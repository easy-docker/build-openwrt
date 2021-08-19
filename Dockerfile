FROM ubuntu:20.04

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt upgrade -yyq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -yyq binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -yyq lib32gcc1 libc6-dev-i386 subversion flex uglifyjs gcc-multilib \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -yyq p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev qemu-utils upx libelf-dev autoconf automake libtool autopoint vim wget bash-completion \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -yyq build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -yyq asciidoc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -yyq xmlto \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -yyq python3 device-tree-compiler g++-multilib linux-libc-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -yyq python2.7 antlr3 gperf curl swig rsync mkisofs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd op -m -s /bin/bash \
    && mkdir /data \
    && chmod 777 /data

ADD update.sh /home/op/update.sh
ADD make.sh /home/op/make.sh
ADD start.sh /start.sh
RUN chmod 777 /home/op/*.sh \
    && chmod 755 /start.sh
USER op

WORKDIR /data

VOLUME ["/data"]

CMD ["/start.sh"]
