FROM nvidia/cuda:11.6.1-cudnn8-runtime-ubuntu18.04
LABEL maintainer="kaka <vn503024@gmail.com>"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tzdata locales pkg-config \
    build-essential \
    cmake \ 
    git \
    python3-dev \
    python3-pip \
    libopencv-dev

RUN apt-get -y autoremove && \
    apt-get -y autoclean && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

# Set timezone
ENV TZ=Asia/Taipei
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Set locale
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ADD requirements.txt requirements.txt
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

WORKDIR /root
