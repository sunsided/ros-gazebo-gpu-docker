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
docker build -t sunside/ros-gazebo-gpu:kinetic-nvidia -f kinetic.Dockerfile .
```

A `ros` user (password `ros`) will be created with default user and group IDs (`1000:1000`). If you need
different values, specify the `ROS_USER_ID` and `ROS_GROUP_ID` build arguments:

```bash
docker build \
    --build-arg ROS_USER_ID=1000 \
    --build-arg ROS_GROUP_ID=1000 \
    -t sunside/ros-gazebo-gpu:kinetic-nvidia \
    -f kinetic.Dockerfile .
```

If the directory the script is started in contains a Catkin workspace, it will automatically
source the `devel/source.bash` script.
