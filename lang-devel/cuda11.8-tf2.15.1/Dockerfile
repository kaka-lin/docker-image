FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu18.04

ENV CUDA_VERSION 11.8
ENV CUDNN_VERSION 8.6.0.163
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

# Install basic dependencies
# set noninteractive installation
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    locales \
    build-essential \
    cmake \
    git \
    wget \
    curl \
    libopencv-dev \
    libsnappy-dev \
    python-dev python3-dev\
    python-pip python3-pip\
    tzdata \
    vim \
    lsb-core \
    ca-certificates \
    pkg-config

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

# Install Miniconda in /opt/conda
ENV PYTHON_VERSION="3.10"
ENV CONDA_PATH="/usr/local/anaconda3"
RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p ${CONDA_PATH} && \
    ${CONDA_PATH}/bin/conda update -n base conda && \
    ${CONDA_PATH}/bin/conda install python=${PYTHON_VERSION} && \
    ${CONDA_PATH}/bin/conda clean -y -a && \
    # init conda for bash and reload the environment
    # Because you nedd run 'conda init' before 'conda activate' in the Dockerfile
    #
    # Enable conda for the for all users (conda initialize)
    ln -s ${CONDA_PATH}/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    # Enable conda for the current user (conda initialize)
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    rm ~/miniconda.sh && \
    rm -rf /temp/*

ENV PATH=${CONDA_PATH}/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/cuda-10.0/lib64:/usr/local/cuda-10.0/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# Make RUN commands use `bash --login`:
SHELL [ "bin/bash","--login","-c" ]

ENV PATH=${CONDA_PATH}/bin:$PATH

# update pip
RUN pip install --upgrade pip

ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

WORKDIR /root
