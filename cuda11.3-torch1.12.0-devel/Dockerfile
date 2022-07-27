FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel
LABEL maintainer="kaka <vn503024@gmail.com>"

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
