FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04
LABEL maintainer="kaka <vn503024@gmail.com>"

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

# Install Pytorch (cuda8.0)
RUN conda install pytorch torchvision cuda80 -c pytorch && \
    pip install matplotlib opencv-python click

# Set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# Set locale
ENV LANG C.UTF-8 
ENV LC_ALL C.UTF-8