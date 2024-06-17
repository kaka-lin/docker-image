# kakalin/lang:devel-py310-tf2.15

## Environments

- Ubunut: 18.04
- CUDA: 11.8.0
- cuDNN: 8.6.0
- Miniconda: latest
- Python: 3.10.14
- Tensorflow: 2.15.1
- Jupyter: latest

## Build & PUSH

```bash
# building docker image
$ ./build.sh

# Push to Docker Hub
$ ./deploy.sh
```

## Running

1. Common

```bash
# Start a GPU enabled container on all GPUs
$ docker run -it --rm --gpus all kakalin/lang:lang:devel-py310-tf2.15 

# Start a GPU enabled container on two GPUs
$ docker run -it --rm --gpus 2 kakalin/lang:lang:devel-py310-tf2.15

# Starting a GPU enabled container on specific GPUs
$ docker run -it --rm --gpus '"device=1"' kakalin/lang:lang:devel-py310-tf2.15
```

2. Mount directory and Publish port to run `jupyter/tensorboard`

```bash
$ docker run -it --rm --gpus all \
-v <local directory>:<Container directory> \
-p 8888:8888 \ 
-p 6006:6006 \
kakalin/lang:lang:devel-py310-tf2.15
```
   - 8888: jupyter
   - 6006: tensorboard

#### In container

1. Run Jupyter
   
    ```bash
    # --all-root: in container is root user.
    # --ip="*": listen to all IP address.
    $ jupyter notebook --allow-root --no-browser --ip="*"
    ```

2. Run Tensorboard

    ```
    $ tensorboard --logdir=<LOG_DIRS> --host 0.0.0.0 
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
