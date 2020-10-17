#!/bin/bash

docker run -it --hostname rosbox --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --env="DISPLAY" --net=host -v $HOME/Projects:$HOME/Projects -v $HOME/RosDeps:$HOME/RosDeps rosbox:1.0
