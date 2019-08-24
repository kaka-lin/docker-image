FROM library/ubuntu:18.04
LABEL maintainer="kaka <vn503024@gmail.com>"

# tzdata issue
ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
    build-essential \
    cmake \
    git \
    wget \
    libopencv-dev \
    libsnappy-dev \
    python-dev python3-dev\
    python-pip python3-pip\
    tzdata \
    vim

# Install miniconda for python 3.6
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    sh Miniconda3-latest-Linux-x86_64.sh -b -p /usr/local/anaconda3 && \
    /usr/local/anaconda3/bin/conda update -n base conda && \
    /usr/local/anaconda3/bin/conda install python=3.6 && \
    /usr/local/anaconda3/bin/conda clean -y -a && \
    rm -rf /temp/*

ENV PATH=/usr/local/anaconda3/bin:$PATH

# Install Tensorflow 2.0
RUN pip install tensorflow==2.0.0-rc0 \
    matplotlib opencv-python numpy==1.16.4 \
    jupyter

# Set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# Set locale
ENV LANG C.UTF-8 
ENV LC_ALL C.UTF-8

# Workdir: /root
WORKDIR /root