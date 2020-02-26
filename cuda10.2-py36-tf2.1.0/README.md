# kakalin/kimage

## Environments

- Ubunut: 18.04
- CUDA: 10.2
- Miniconda: latest
- Python: 3.6
- Tensorflow: 2.1.0
- Jupyter: latest

## Build

```bash
$ docker build --rm -t kakalin/kimage:cuda10.2-py36-tf2.1.0 .
```

## Running

1. Common

```bash
# Start a GPU enabled container on all GPUs
$ docker run -it --rm --gpus all kakalin/kimage:cuda10.2-py36-tf2.1.0

# Start a GPU enabled container on two GPUs
$ docker run -it --rm --gpus 2 kakalin/kimage:cuda10.2-py36-tf2.1.0

# Starting a GPU enabled container on specific GPUs
$ docker run -it --rm --gpus '"device=1"' kakalin/kimage:cuda10.2-py36-tf2.1.0
```

2. Mount directory and Publish port to run jupyter

```
$ docker run -it --rm --gpus all \
-v <local directory>:<Container directory> \
-p 8888:8888 \
kakalin/kimage:cuda10.2-py36-tf2.1.0
```

* In container

```bash
# --all-root: in container is root user.
# --ip="*": listen to all IP address.
jupyter notebook --allow-root --no-browser --ip="*"
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
