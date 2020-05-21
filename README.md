# ROS Kinetic Desktop Full + NVIDIA in Docker

**TL;DR:** On Linux, to drop into an X11 enabled container created from [sunside/ros-gazebo-gpu:kinetic-nvidia](https://hub.docker.com/repository/docker/sunside/ros-gazebo-gpu),
run

```bash
./run-nvidia.sh
```

You'll be user `ros` with password `ros` and `sudo` powers.

---

I am aware that ROS Kinetic is somewhat outdated.
However, for some projects I did I had the constraint to
work with Kinetic and Gazebo 7 rather than any newer
version. Since I was using Ubuntu 20.04 at the time
(and ROS Noetic wasn't even released), I created this
repo to help me and possibly others out. It is, after
all, just a digest of information that can also
be found all around the web.

## Sourced documentation

- [Ubuntu install of ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu)
- [Hardware Acceleration](http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration)
- [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-docker)
- [Install Gazebo using Ubuntu Packages](http://gazebosim.org/tutorials?cat=install&tut=install_ubuntu&ver=7.0)
- [Gazebo Models](https://github.com/osrf/gazebo_models) are available
 on Git
- [nvidia/cudagl](https://hub.docker.com/r/nvidia/cudagl/tags?page=1&name=16.04) Docker image

## Problems to steer around

A core issues that arise when just following the official documentation(s) are these:

- The `nvidia-docker2` runtime is now deprecated and has been replaced with `nvidia-container-toolkit`; as a result,
`--runtime="nvidia"` is not a valid option anymore
and `--gpus "all"` (or similar) must be used instead.
- The visualization tools (such as Gazebo and RViz) require OpenGL to work, which isn't available in the offical ROS Docker images (see [here](https://answers.ros.org/question/322029/nvidia-driver-problem-in-ubuntu-1804-host-with-a-ros-kinetic-desktop-full-docker/) and [here](https://stackoverflow.com/questions/44166269/libgl-error-failed-to-load-driver-swrast-in-docker-container)).
- Gazebo 7.0 is provided with the official ROS Docker image, but is outdated (see [here](https://answers.gazebosim.org//question/6347/downloading-models-fails/) and [here](https://answers.gazebosim.org//question/18014/gazebo-7-ambulance-model-and-other-invalid-mesh-filename-extension-crash/)).
- X11 authentication may fail due to a subtle bug when passing arguments along.

## Build with GPU support

For NVIDIA GPU support, go to the [docker/nvidia](docker/nvidia)
directory and follow the instructions [there](docker/nvidia/README.md).

If in a hurry, just run

```bash
docker/nvidia/build.sh
```

This should provide you with the image [`sunside/ros-gazebo-gpu:kinetic-nvidia`](https://hub.docker.com/repository/docker/sunside/ros-gazebo-gpu).

Start the container with

```bash
./run-nvidia.sh
```

and you're ready to go. Note that this will create a container named `ros`, so running the command twice won't work. You can,
however, `docker exec -it ros bash` into the running container as often as you like.
