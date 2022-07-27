# kakalin/kimage

## Environments

- Ubunut: 18.04
- CUDA: 11.3
- cuDNN: 8.2.0
- Python: 3.7.12
- Pytorch: 1.12.0

## Build

```bash
#$ docker build --rm -t kakalin/kimage:cuda11.3-torch1.12.0-devel .
$ ./build.sh
```

## Run

```bash
$ docker run -it --rm --gpus all kakalin/kimage:cuda11.3-torch1.12.0-devel
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
