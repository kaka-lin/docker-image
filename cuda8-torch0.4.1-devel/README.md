# kakalin/kimage

## Environments

- Ubunut: 16.04
- CUDA: 8.0
- Miniconda: latest
- Python: 3.6
- Pytorch: 0.4.1

## Build

```bash
$ docker build --rm -t kakalin/kimage:cuda8-torch0.4.1-devel .
```

## Run

```bash
$ docker run -it --runtime=nvidia --rm kakalin/kimage:cuda8-torch0.4.1-devel
```
