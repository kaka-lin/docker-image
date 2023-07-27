FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu18.04

ENV CUDA_VERSION 11.6
ENV CUDNN_VERSION 8.4.0.27
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

# Install basic dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
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

# Install miniconda for python 3.8
ENV PYTHON_VERSION="3.8"
ENV CONDA_PATH="/usr/local/anaconda3"
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    sh Miniconda3-latest-Linux-x86_64.sh -b -p ${CONDA_PATH} && \
    ${CONDA_PATH}/bin/conda update -n base conda && \
    ${CONDA_PATH}/bin/conda install python=${PYTHON_VERSION} && \
    ${CONDA_PATH}/bin/conda clean -y -a && \
    rm -rf Miniconda3-latest-Linux-x86_64.sh && \
    rm -rf /temp/* 

ENV PATH=${CONDA_PATH}/bin:$PATH

# update pip
RUN pip install --upgrade pip

ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

WORKDIR /root
