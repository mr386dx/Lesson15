FROM ubuntu:20.04
LABEL maintainer="mr.redwind@gmail.com"
ENV Status="mr.386dx"
ENV datex 2022–08–20

ADD Lesson12 /directory

RUN apt-get update
RUN apt-get install python3 -y
RUN apt-get install net-tools -y

# These packets are necessary to install Jenkins
RUN apt-get install wget -y
RUN apt-get install gnupg -y
RUN apt-get install gnupg2 -y
RUN apt-get install gnupg1 -y

# Need to install Java, to run Jenkins
RUN apt-get install openjdk-8-jdk -y
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install jenkins -y
RUN service jenkins start

VOLUME /devops_volume
ADD https://github.com/mr386dx/Lesson12.git  /var/lib/docker/volumes/devops_volume/
EXPOSE 8080
CMD [ "/bin/bash", "/directory/hello_world.sh" ]

