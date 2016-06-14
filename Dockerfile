############################################################
# Dockerfile to build Horizon Testing container images
# Based on Ubuntu trusty
############################################################
# Set the base image to Ubuntu
FROM ubuntu:trusty
# File Author / Maintainer
MAINTAINER Weezer Su

ENV os_release="master"
RUN apt-get update
RUN apt-get install -y git xvfb firefox inetutils-tools inetutils-ping ping python-setuptools python-dev build-essential
RUN easy_install pip
RUN pip install virtualenv
RUN git clone -b $os_release https://github.com/openstack/horizon.git /opt/horizon
CMD tail -f /dev/null
