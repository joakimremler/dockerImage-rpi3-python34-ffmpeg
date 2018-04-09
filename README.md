# dockerImage-joakimremler/rpi3-python34-ffmpeg

## Versions

Raspberry pi: 3
Python: 3.4
ffmpeg: 3.2.10
Opencv: 3.1.0
Numpy: 1.14.2

## Build

docker build -t joakimremler/rpi3-python34-ffmpeg: --Version-- .

## Run

docker run -td joakimremler/rpi3-python34-ffmpeg: --Version--

##### Keep running

docker run -td joakimremler/rpi3-python34-ffmpeg: --Version-- sleep infinity

## Login to container

docker exec -it --container-id-- bash

### Insperation

##### Install OpenCV on Rpi

https://www.pyimagesearch.com/2016/04/18/install-guide-raspberry-pi-3-raspbian-jessie-opencv-3/
https://raspberrypi.stackexchange.com/questions/69169/how-to-install-opencv-on-raspberry-pi-3-in-raspbian-jessie/69176
https://hub.docker.com/r/rickryan/rpi-jessie-opencv3.2/

##### Show running containers

docker ps

##### Stop / cleanup

####### Stop

* docker stop --container-id--

####### Cleanup

######## Containers, networks, images, cache

* docker system prune

####### Volumes

* docker volume rm $(docker volume ls -qf dangling=true)

####### Images

* docker rmi -f $(docker images -a -q)
