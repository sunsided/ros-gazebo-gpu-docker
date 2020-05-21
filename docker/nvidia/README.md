# ROS + NVIDIA

**TL;DR:** Run `./build.sh` in this directory.

---

To build a Docker image with NVIDIA GPU support for ROS Kinetic as described in the [Hardware Acceleration](http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration) tutorial,
run

```bash
docker build -t ros:kinetic-gazebo7-xenial-nvidia -f kinetic.Dockerfile .
```
