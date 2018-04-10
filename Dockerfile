FROM resin/rpi-raspbian:jessie

# Update and Upgrade
RUN apt-get -qy update
RUN apt-get -qy upgrade
RUN apt-get -qy install rpi-update

# Install OpenCV and python3
RUN apt-get -qy install \
  libjpeg-dev \
  build-essential git cmake pkg-config \
  libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev 

RUN apt-get -qy install \
  libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
  libxvidcore-dev libx264-dev 

RUN apt-get -qy install \
  libgtk2.0-dev \
  libatlas-base-dev gfortran

RUN cd ~ && \
  git clone https://github.com/Itseez/opencv.git && \
  cd opencv && \
  git checkout 3.1.0


RUN cd ~ && \
  git clone https://github.com/Itseez/opencv_contrib.git && \
  cd opencv_contrib && \
  git checkout 3.1.0

RUN apt-get -qy install python3-dev

RUN apt-get -qy install wget 

RUN wget https://bootstrap.pypa.io/get-pip.py && \
  python3 get-pip.py

RUN pip install numpy

RUN cd ~/opencv && \
  mkdir build && \
  cd build && \
  cmake -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=/usr/local \
  -D INSTALL_C_EXAMPLES=OFF \
  -D INSTALL_PYTHON_EXAMPLES=ON \
  -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
  -D BUILD_EXAMPLES=ON ..

RUN cd ~/opencv/build && \
  make -j4
RUN cd ~/opencv/build && \
  make install 

RUN ldconfig

# Install FFmpeg
RUN echo "deb http://mirrordirector.raspbian.org/raspbian/ stretch main contrib non-free rpi" | sudo tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install v4l-utils libmariadbclient18 libpq5 ffmpeg

# Install nano
RUN apt-get -qy install nano

# Install rzync
RUN apt-get -qy install rsync

# Install ssh
RUN apt-get -qy install ssh