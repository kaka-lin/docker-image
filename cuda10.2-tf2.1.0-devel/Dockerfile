FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
LABEL maintainer="kaka <vn503024@gmail.com>"

ENV CUDNN_VERSION 7.6.5.32
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && apt-get install -y --no-install-recommends \
    libcudnn7=$CUDNN_VERSION-1+cuda10.2 \
    libcudnn7-dev=$CUDNN_VERSION-1+cuda10.2 \
    && \
    apt-mark hold libcudnn7 && \
    rm -rf /var/lib/apt/lists/*

# Ubuntu 18.04: tzdata issue
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
    tzdata \
    vim \
    lsb-core

# Set timezone
RUN ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

# Set locale
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Install miniconda for python 3.6
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    sh Miniconda3-latest-Linux-x86_64.sh -b -p /usr/local/anaconda3 && \
    /usr/local/anaconda3/bin/conda update -n base conda && \
    /usr/local/anaconda3/bin/conda install python=3.6 && \
    /usr/local/anaconda3/bin/conda clean -y -a && \
    rm -rf /temp/*

ENV PATH=/usr/local/anaconda3/bin:$PATH

# update pip
RUN pip install --upgrade pip

# Install Tensorflow 2.0 and other necessary libries
RUN pip install numpy scipy pandas matplotlib seaborn
RUN pip install opencv-python pillow sklearn tensorflow-gpu==2.1.0
RUN pip install jupyter jupyterlab

