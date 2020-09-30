FROM ubuntu:latest

RUN apt-get update && apt-get -y install sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

RUN echo "Set disable_coredump false" >> /etc/sudo.conf

WORKDIR /home/docker

USER docker

CMD /bin/bash
