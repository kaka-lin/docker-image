# kakalin/kimage

## Environments

- Ubunut: 18.04
- CUDA: 11.6
- cuDNN: 8.4.0
- Miniconda: latest
- Python: 3.8.13
- Tensorflow: 2.9.1
- Jupyter: latest

## Build

```bash
#$ docker build --rm -t kakalin/kimage:cuda11.6-tf2.9.1-devel .
$ ./build.sh
```

## Running

1. Common

```bash
# Start a GPU enabled container on all GPUs
$ docker run -it --rm --gpus all kakalin/kimage:cuda11.6-tf2.9.1-devel 

# Start a GPU enabled container on two GPUs
$ docker run -it --rm --gpus 2 kakalin/kimage:cuda11.6-tf2.9.1-devel

# Starting a GPU enabled container on specific GPUs
$ docker run -it --rm --gpus '"device=1"' kakalin/kimage:cuda11.6-tf2.9.1-devel
```

2. Mount directory and Publish port to run jupyter

```
$ docker run -it --rm --gpus all \
-v <local directory>:<Container directory> \
-p 8888:8888 \
kakalin/kimage:cuda11.6-tf2.9.1-devel
```

* In container

```bash
# --all-root: in container is root user.
# --ip="*": listen to all IP address.
jupyter notebook --allow-root --no-browser --ip="*"
```

## Validate your installation

### 1. CUDA Version

```bash
$ cat /usr/local/cuda/version.txt

# or

$ nvcc --version
```

### 2. cuDNN Version

```bash
$ cat /usr/include/cudnn_version.h  | grep CUDNN_MAJOR -A 2
```
