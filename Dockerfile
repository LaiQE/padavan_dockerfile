FROM ubuntu:18.04

# 这个加不加没有很大影响
ENV DEBIAN_FRONTEND noninteractive

RUN set -ex \ 
    && sed -i 's#http://archive.ubuntu.com#http://mirrors.aliyun.com#' /etc/apt/sources.list \
    && sed -i 's#http://security.ubuntu.com#http://mirrors.aliyun.com#' /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install unzip libtool-bin curl cmake gperf gawk flex bison nano xxd \
    cpio git python-docutils gettext automake autopoint texinfo build-essential help2man \
    pkg-config zlib1g-dev libgmp3-dev libmpc-dev libmpfr-dev libncurses5-dev libltdl-dev \
    gcc-multilib module-init-tools wget sudo\
    # sudo很重要一定要用sudo运行,就算是root用户也要sudo,不然编译可以通过但是烧进去启动不了
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y

WORKDIR /opt
CMD ["/bin/bash"]
