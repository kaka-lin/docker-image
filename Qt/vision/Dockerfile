FROM kakalin/qt:5.12.0
LABEL maintainer="kaka <vn503024@gmail.com>"

RUN sudo apt-get update && \
    sudo apt-get install -y --no-install-recommends \
    zip unzip \
    libgtk2.0-dev pkg-config \
    gstreamer1.0-x

RUN sudo apt-get -y autoremove && \
    sudo apt-get -y autoclean && \
    sudo apt-get -y clean && \
    sudo rm -rf /var/lib/apt/lists/*

# Install OpenCV (Need to install Python and Numpy first for building Python bindings)
# Because we need OpenCV with GStreamer
RUN pip install numpy==1.21
RUN wget https://github.com/opencv/opencv/archive/3.4.2.zip
RUN unzip 3.4.2.zip && \
    cd opencv-3.4.2 && \
    mkdir build && cd build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
          -D CMAKE_INSTALL_PREFIX=/usr/local \
	      -D ENABLE_FAST_MATH=1 \
	      -D WITH_V4L=ON \
          -D WITH_GTK=ON \
	      -D WITH_OPENGL=ON \
	      -D WITH_GSTREAMER=ON \
          -D PYTHON3_LIBRARY=$CONDA_PATH/lib/libpython${PYTHON_VERSION}.so \
	      -D OPENCV_GENERATE_PKGCONFIG=ON ..

RUN cd opencv-3.4.2/build && \
    make -j8 && sudo make install -j8

RUN rm 3.4.2.zip && rm -r opencv-3.4.2

# Would cause issue:
#   Cannot mix incompatible Qt library (version 0x50c00) with this library (version 0x50c01)
#
# In iiot/qt:5.12.0
#   ENV PATH="/usr/local/qt5/bin:$PATH"
#   ENV LD_LIBRARY_PATH="/usr/local/qt5/lib:$LD_LIBRARY_PATH"
#
# So we need to unset `LD_LIBRARY_PATH`
USER user
ENV LD_LIBRARY_PATH=""
RUN sudo cp /usr/local/lib/python${PYTHON_VERSION}/site-packages/cv2.cpython-38-x86_64-linux-gnu.so \
    /usr/local/anaconda3/lib/python${PYTHON_VERSION}/site-packages/
