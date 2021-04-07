# kakalin/kimage

## Environments

- Ubunut: 18.04
- CUDA: 11.1.105
- cuDNN: 8.0.5
- Python: 3.8.8
- Pytorch: 1.8.0

## Build

```bash
$ docker build --rm -t kakalin/kimage:cuda11.1-torch1.8-devel .
```

## Run

```bash
$ docker run -it --runtime=nvidia --rm kakalin/kimage:cuda11.1-torch1.8-devel
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
cat /usr/include/cudnn_version.h | grep CUDNN_MAJOR -A 2
```
