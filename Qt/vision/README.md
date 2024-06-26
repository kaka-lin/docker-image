# Qt/QML and OpenCV with GStreamer

This docker image is for Using OpenCV to open YUV format file and show it on Qt/QML GUI.

---

- Qt/QML: 5.12.0
  - Support PyQt5
- OpenCV: 3.4.2
  - Support `V4L2`
  - Support `GTK`
  - Support `OPENGL`
  - Support `GSTREAMER`

## Build the image (Optional)

```bash
# $ docker build --rm -t kakalin/qt:5.12.0_opencv_gstreamer .
$ ./build.sh
```

### Push to Docker Hub

```bash
$ docker login
# $ docker push kakalin/qt:5.12.0_opencv_gstreamer
$ ./deploy.sh
```

## Run

- [Ubuntu](#ubuntu)
- [macOS](#2-macos)


### Ubuntu

Expose the X server on the host

```bash
# Expose the X server on the host
$ xhost +local:docker
```

If you want to use GPU, please add `--gpus all`.

> GPU: Please refer to [nvidia-docker](https://github.com/NVIDIA/nvidia-docker)

```bash
$ docker run --rm -it \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix" \
    --volume="$PWD:/home/user/YUVPlayer" \
    --network=host \
    -v $HOME/.Xauthority:/root/.Xauthority \
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
    -w /home/user/YUVPlayer \
    --privileged \
    kakalin/qt:5.12.0_opencv_gstreamer
```

- `--privileged`: sharing any devices in /dev

> Notice current path, if you use `$PWD`, you should in the root path of the  project,

---

### `macOS`

Reference: [X11 in docker on macOS](https://gist.github.com/cschiewek/246a244ba23da8b9f0e7b11a68bf3285)

1. Install [XQuartz](https://dl.bintray.com/xquartz/downloads/XQuartz-2.7.11.dmg) from official website or through [Homebrew](https://brew.sh/)

    ```bash
    $ brew install --cask xquartz
    ```

    and then `Restart OS`.

2. Open XQuartz and Check the option: `XQuartz -> Preferences -> Security -> "Allow connections from network clients"`

    ```bash
    # open XQuartz
    $ open -a XQuartz
    ```

3. In terminal:

    ```bash
    # Expose the X server on the host
    $ xhost +localhost
    ```

    Creating a bridge between a network socket with a TCP listener on port `6000` (the default port of the X window system) and the X window server on my OS X host.

    ```bash
    $ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
    ```

    ```bash
    $ docker run --rm -it \
        -e DISPLAY=host.docker.internal:0 \
        -e QT_X11_NO_MITSHM=1 \
        --volume="/tmp:/tmp" \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --volume="$PWD:/home/user/YUVPlayer" \
        --network=host \
        -v $HOME/.Xauthority:/root/.Xauthority \
        -w /home/user/YUVPlayer \
        --privileged \
        -e QT_QUICK_BACKEND=software \
        kakalin/qt:5.12.0_opencv_gstreamer
    ```

## Troubleshooting

1. `libGL error: No matching fbConfigs or visuals found`

    ```bash
    $ export LIBGL_ALWAYS_INDIRECT=1
    ```

2. `QGLXContext: Failed to create dummy context`

    Workaround:

    ```bash
    $ export QT_QUICK_BACKEND=software
    ```

3. Miniconda install issue:
    - Install Python3.8, `ModuleNotFoundError: No module named 'conda.cli.main_info'`

        ```
        comment `conda update -n base conda`
        ```

4. `Qt is not found`

    Opening ```CMakeLists.txt``` and uncomment ```list(APPEND CMAKE_PREFIX_PATH ${Your Qt path})``` and modify Qt location
