FROM osrf/ros:noetic-desktop-full
ARG TZ=America/New_York
ARG USR=devr
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git git-lfs curl ddd valgrind cmake vim sudo lsb-release wget gnupg libgazebo11-dev
RUN apt-get clean all

RUN useradd -ms /bin/bash $USR
RUN usermod -aG sudo $USR
RUN mkdir -p /home/$USR/Projects /home/$USR/RosDeps
RUN chown -R $USR:$USR /home/$USR
RUN echo 'source /opt/ros/noetic/setup.bash' >> /home/$USR/.bashrc
RUN echo 'root:root'|chpasswd

# Clean up!
RUN apt-get clean all

# Set up entry
USER $USR
WORKDIR /home/$USR
RUN echo 'tar czf RosDeps.tgz /opt/ros/' >> CopyRosDeps.sh
ENTRYPOINT ["/bin/bash"]
