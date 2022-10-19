FROM pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel
LABEL maintainer="kaka <vn503024@gmail.com>"

# Solve Error: NO_PUBKEY A4B469963BF863CC
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tzdata locales sudo pkg-config

RUN sudo apt-get -y autoremove && \
    sudo apt-get -y autoclean && \
    sudo apt-get -y clean && \
    sudo rm -rf /var/lib/apt/lists/*

# Set timezone
ENV TZ=Asia/Taipei
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Set locale
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

WORKDIR /root
