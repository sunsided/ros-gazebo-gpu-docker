#!/usr/bin/env bash
# See http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration

set -euo pipefail

# See README.md for building this image.
CONTAINER_NAME=ros
DOCKER_IMAGE=sunside/ros-gazebo-gpu:kinetic-nvidia

# Which GPUs to use; see https://github.com/NVIDIA/nvidia-docker
GPUS="all"

XSOCK=/tmp/.X11-unix

XAUTH=`pwd`/.tmp/docker.xauth
XAUTH_DOCKER=/tmp/.docker.xauth

if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo "$xauth_list" | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

docker run --rm -it \
    --name "$CONTAINER_NAME" \
    --gpus "$GPUS" \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="XAUTHORITY=$XAUTH_DOCKER" \
    --volume="$XSOCK:$XSOCK:rw" \
    --volume="$XAUTH:$XAUTH_DOCKER:rw" \
    $DOCKER_IMAGE \
    bash
