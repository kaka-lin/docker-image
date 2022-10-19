# Docker Image

This repository is for building a Docker images

## Tags available

Check the [DockerHub](https://hub.docker.com/repository/docker/kakalin/kimage)

## Categories 

### Tensorflow

|  OS<br>Platform  |  CPU/GPU  |  Python  |  Frameworks  |  Jupyter  |  Dockerfile  |
|  :------------:  |  :-----:  |  :----:  |  :--------:  |  :-----:  |  :--------:  |
|  Ubuntu<br>18.04  |  CPU  |  3.6  |  Tensorflow 2.0.0  |  Yes  |  [Link](https://github.com/kaka-lin/docker-image/tree/master/cpu-tf2.0.0-devel)  |
|  Ubuntu<br>18.04  |  CUDA 10.2<br>cuDNN 7  |  3.6  |  Tensorflow 2.1.0  |  Yes  |  [Link](https://github.com/kaka-lin/docker-image/tree/master/cuda10.2-tf2.1.0-devel)  |
|  Ubuntu<br>18.04  |  CUDA 11.6<br>cuDNN 8  |  3.8  |  Tensorflow 2.9.1  |  Yes  |  [Link](https://github.com/kaka-lin/docker-image/tree/master/cuda11.6-tf2.9.1-devel)  |


### Pytorch

|  OS<br>Platform  |  CPU/GPU  |  Python  |  Frameworks  |  Jupyter  |  Dockerfile  |
|  :------------:  |  :-----:  |  :----:  |  :--------:  |  :-----:  |  :--------:  |
|  Ubuntu<br>16.04  |  CUDA 8.0,<br>cuDNN 6  |  3.6  |  Pytorch 0.4.1  |  No  |  [Link](https://github.com/kaka-lin/docker-image/tree/master/cuda8-torch0.4.1-devel)  |
|  Ubuntu<br>18.04  |  CUDA 11.1,<br>cuDNN 8  |  3.8  |  Pytorch 1.8.1  |  No  |  [Link](https://github.com/kaka-lin/docker-image/tree/master/cuda11.1-torch1.8-devel)  |
|  Ubuntu<br>18.04  |  CUDA 11.3,<br>cuDNN 8  |  3.7  |  Pytorch 1.12.0  |  No  |  [Link](https://github.com/kaka-lin/docker-image/tree/master/cuda11.3-torch1.12.0-devel)  |

### ONNX

|  OS<br>Platform  |  CPU/GPU  |  Python  |  Frameworks  |  Jupyter  |  Dockerfile  |
|  :------------:  |  :-----:  |  :----:  |  :--------:  |  :-----:  |  :--------:  |
|  Ubuntu<br>18.04  |  CUDA 11.6,<br>cuDNN 8  |  3.8  |  ONNX 1.12.0  |  No  |  [Link](https://github.com/kaka-lin/docker-image/tree/master/onnxrt-1.12.0-runtime)  |

### Others

- Qt: please see [here](https://github.com/kaka-lin/qt-template/tree/master/docker)
- PCL: please see [here](https://github.com/kaka-lin/autonomous-driving-notes/tree/master/PCL/00_installation)
