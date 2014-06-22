# docker for sitespeed.io
#
# VERSION 1

FROM ubuntu:13.10
MAINTAINER TaopaiC, pctao.tw@gmail.com
# packages
RUN dpkg-divert --local --rename /usr/bin/ischroot && ln -sf /bin/true /usr/bin/ischroot
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get upgrade -y
# nodejs
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs
# install sitespeed.io
RUN apt-get install -y wget phantomjs curl xsltproc default-jre xvfb firefox
ADD source/google-chrome.list /etc/apt/sources.list.d/
## # install google-chrome
## RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A040830F7FAC5991
## RUN apt-get update
## RUN apt-get install -y google-chrome-stable
# add xvfb script
ADD scripts/xvfb /etc/init.d/xvfb
RUN chmod 755 /etc/init.d/xvfb
# install sitespeed.io
ADD https://github.com/sitespeedio/sitespeed.io/releases/download/v2.5.7/sitespeed.io-2.5.7.tar.gz /tmp/
RUN cd /opt/ ; tar zxvf /tmp/sitespeed.io-2.5.7.tar.gz
RUN ln -s /opt/sitespeed.io-2.5.7 /opt/sitespeed.io
ADD scripts/sitespeed.io-xvfb /opt/sitespeed.io/bin/sitespeed.io-xvfb
RUN chmod 755 /opt/sitespeed.io/bin/sitespeed.io-xvfb
WORKDIR /result