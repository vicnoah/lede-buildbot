FROM ubuntu:16.04
MAINTAINER 15244909057.ww@gmail.com

RUN \
  apt-get update && \
  apt-get -y upgrade && 
  apt-get install subversion g++ zlib1g-dev build-essential git python rsync man-db && \
  apt-get install libncurses5-dev gawk gettext unzip file libssl-dev wget vim && \
  rm -rf /var/lib/apt/lists/* 

WORKDIR /
  
RUN \
  git clone https://github.com/coolsnowwolf/lede.git && \
  cd lede && \
  ./scripts/feeds update -a && \
  ./scripts/feeds install -a


#允许使用root进行编译
ENV FORCE_UNSAFE_CONFIGURE 1

WORKDIR /lede

CMD ["/bin/bash"]
