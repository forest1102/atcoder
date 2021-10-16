FROM python:slim
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
RUN apt-get update -y && \ 
apt-get install -y \
  git \
  make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev \
  gcc

ENV CHOOSENIM_CHOOSE_VERSION=1.0.6
RUN [ "/bin/bash", "-c", "bash <( curl https://nim-lang.org/choosenim/init.sh -s ) -y" ]
ENV PATH=/root/.nimble/bin:$PATH

ENV HOME /root
WORKDIR /workspace
RUN git init && \ 
git submodule init && \ 
git submodule add -f https://github.com/zer0-star/Nim-ACL.git ac-library-nim --init

RUN pip install atcoder-tools
