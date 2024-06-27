# Xilinx:dnndk3.1-cuda10.0-tf1.2

GPU Platform Software and DNNDK Host Tools

## Environment

- Ubunut: 18.04
- Python: 3.6
- CUDA: 10.0
- cuDNN: 7.4.1
- Tensorflow: 1.12.0 (not supported in python3.8)
- Juoyter & JupyterLab: latest

### TF version issue

-[Can't install Tensorflow v1.15 with pip](https://github.com/tensorflow/tensorflow/issues/39380)

## Build

Download all files in [here](https://drive.google.com/drive/u/0/folders/1imzZeYr0kLBBRIkM0t4j6Hkrd6_kdbFJ), and move to `dnndk_v3.1/decent-tf` folder.

```bash
$ ./build.sh
```

## Running and Testing the container image we just build

```bash
$ docker run -it --rm --gpus all kakalin/xilinx:dnndk3.1-cuda10.0-tf1.2

# Volumes: mount directory
# Publish port:
$ docker run -it --rm --gpus all \
-p <port on the Docker host>:<port in the container> \
-v <掛載的local>:<Container目錄> \
kakalin/xilinx:dnndk3.1-cuda10.0-tf1.2

# Example
#   1. Volumes: /home/megrez/Projects/ADAS
#   2. Publish port: Map TCP port 8888 (jupyter default) in the container 
#                    to port 8888 on the Docker host.
$ docker run -it --rm --gpus all \
-p 8888:8888 \
-v /home/megrez/Projects/ADAS:/root/ADAS \
kakalin/xilinx:dnndk3.1-cuda10.0-tf1.2
```

## Validate your installation

```bash
$ decent_q --help
```

## Run Jupyter in container

```bash
$ jupyter notebook --allow-root --no-browser --ip="*"
```

## Note

### 1. cuDNN location

```bash
/usr/local/cuda/include/cudnn.

# or

/usr/include/cudnn.h
```

chek cuDNN version:

```bash
$ cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2

# or

$ cat /usr/include/cudnn.h | grep CUDNN_MAJOR -A 2
```

### 2. cuDNN downgrades

Ref: [Nvidia: cudnn7 - Dockerfile](https://gitlab.com/nvidia/cuda/blob/master/dist/ubuntu18.04/10.0/devel/cudnn7/Dockerfile)
