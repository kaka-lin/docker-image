# kakalin/kimage

## Environments

- Ubunut: 18.04
- CUDA: None
- Miniconda: latest
- Python: 3.6
- Tensorflow: 2.0.0
- Jupyter: latest

## Build

```bash
$ docker build --rm -t kakalin/kimage:cpu-mconda-py36-tf200 .
```

## Running

1. Common

```bash
$ docker run -it --rm kakalin/kimage:cpu-mconda-py36-tf200
```

2. Can run Jupyter

```bash
$ docker run -it -p 8888:8888 --rm kakalin/kimage:cpu-mconda-py36-tf200
```
* In container

```bash
# --all-root: in container is root user.
# --ip="*": listen to all IP address.
jupyter notebook --allow-root --no-browser --ip="*"
```