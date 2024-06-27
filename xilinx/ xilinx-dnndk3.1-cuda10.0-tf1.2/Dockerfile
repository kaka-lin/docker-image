FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
LABEL maintainer="kaka <lin.kaka@inventec.com>"

# cuDNN: downgrad to 7.4.1
RUN apt-get update && apt-get install -y --no-install-recommends --allow-downgrades --allow-change-held-packages \
    libcudnn7=7.4.1.5-1+cuda10.0 \
    libcudnn7-dev=7.4.1.5-1+cuda10.0 \
    && \
    apt-mark hold libcudnn7 && \
    rm -rf /var/lib/apt/lists/*

# Ubuntu 18.0: tzdata issue
ENV TZ=/Asia/Taipei \
    DEBIAN_FRONTEND=noninteractive

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
    vim \
    tzdata \
    lsb-core

# Set timezone
RUN ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

# Set locale
ENV LANG C.UTF-8 
ENV LC_ALL C.UTF-8

# Install miniconda for python 3.6
RUN wget https://repo.continuum.io/miniconda/Miniconda3-3.6.0-Linux-x86_64.sh && \
    chmod +x Miniconda3-3.6.0-Linux-x86_64.sh && \
    bash Miniconda3-3.6.0-Linux-x86_64.sh -b -p /usr/local/anaconda3 && \
    /usr/local/anaconda3/bin/conda update conda && \
    /usr/local/anaconda3/bin/conda install python=3.6 && \
    /usr/local/anaconda3/bin/conda clean -y -a && \
    rm -rf /temp/*

ENV PATH=/usr/local/anaconda3/bin:$PATH

# update pip
RUN pip install --upgrade pip

### Install DNNDK
## Installing the GPU Platform Software

# Caffe Version: Installing Dependent Libraries
RUN apt-get install -y --force-yes build-essential autoconf libtool libopenblas-dev \
libgflags-dev libgoogle-glog-dev libopencv-dev protobuf-compiler libleveldb-dev \
liblmdb-dev libhdf5-dev libsnappy-dev libboost-all-dev libssl-dev

# Install prerequisites
RUN pip install opencv-python sklearn scipy progressbar2 matplotlib numpy==1.16.4
RUN pip install jupyter jupyterlab

# TensorFlow Version: Installing with Anaconda
# Install ${DECENT_Q_TF_PKG} (Tensorflow 1.12.0)
RUN mkdir /root/dnndk_v3.1/
COPY ./dnndk_v3.1/ /root/dnndk_v3.1/
RUN pip install /root/dnndk_v3.1/decent-tf/tensorflow_gpu-1.12.0-cp36-cp36m-linux_x86_64.whl

# Installing the DNNDK Host Tools
WORKDIR /root/dnndk_v3.1
RUN ./install.sh ZCU104
WORKDIR /root
