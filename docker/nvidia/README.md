# ROS + NVIDIA

**TL;DR:** Run `./build.sh` in this directory.

---

We cannot simply build our image from `osrf/ros:kinetic-desktop-full-xenial` as it lacks
the OpenGL pieces required to make the visualization applications work. Instead, we're building
from `nvidia/cudagl:9.0-base-ubuntu16.04` (Ubuntu Xenial) and install `ros-kinetic-desktop-full`
from the package manager. Since this brings in an outdated version of Gazebo 7, we also
upgrade `gazebo7` using its [official sources](http://gazebosim.org/tutorials?cat=install&tut=install_ubuntu&ver=7.0).

To build the image, run

```bash
docker build -t ros:kinetic-gazebo7-xenial-nvidia -f kinetic.Dockerfile .
```
