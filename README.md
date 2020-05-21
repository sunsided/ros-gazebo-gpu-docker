# ROS Kinetic Desktop Full + NVIDIA in Docker

I am aware that ROS Kinetic is somewhat outdated.
However, for some projects I did, I had the constraint to
work with Kinetic and Gazebo 7 rather than any newer
version. Since I was using Ubuntu 20.04 at the time
(and ROS Noetic wasn't even released), I created this
repo to help me and possibly others out. It is, after
all, just a digest of information that can also
be found all around the web (including the [official documentation](http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration)).

## GPU support

For NVIDIA GPU support, go to the [docker/nvidia](docker/nvidia)
directory and follow the instructions [there](docker/nvidia/README.md).

If in a hurry, just run

```bash
docker/nvidia/build.sh
```

This should provide you with the image `ros-nvidia:kinetic-xenial`
based on `osrf/ros:kinetic-desktop-full-xenial`.
