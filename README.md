# RosBox
Dockerfile extension of the OSRF ROS Noetic container and shell script to facilitate graphical launching

## Building Your Container
You can use this Dockerfile to build your own container with the following command:

```bash
docker build --build-arg TZ=`cat /etc/timezone` --build-arg USR=$USER -t rosbox .
```

## Running Your Container
You can run it with the following command: `./runRosBox.sh`. This script sets up your environment activating display forwarding and will log you into a BASH shell session.

It is recommended to update your username. Do so by changing to `root` user first. Additionally, you may wish to create an archive of the default ROS packages available. Running the `CopyRosDeps.sh` script will do so.

The run script also attempts to mount two volumes from the host (user) directory to the container:

- Projects : Store your various ROS projects here perhaps
- RosDeps : Convenient directory to copy your ROS dependencies to for a host editor to access

