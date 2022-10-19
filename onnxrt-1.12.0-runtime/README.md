# kakalin/kimage

## Environments

- Ubunut: 18.04
- Python: 3.8.13
- CUDA: 11.6
- cuDNN: 8.4.0
- ONNX: 1.12.0
- ONNX Runtime GPU: 1.12.1

## Build

```bash
#$ docker build --rm -t kakalin/kimage:onnxrt-1.12.0-runtime .
$ ./build.sh
```

## Run

```bash
$ docker run -it --rm --gpus all kakalin/kimage:onnxrt-1.12.0-runtime
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
