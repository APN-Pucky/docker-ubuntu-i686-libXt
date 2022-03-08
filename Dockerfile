FROM i686/ubuntu
MAINTAINER APN
RUN apt-get update -y -qq && apt-get install -y -qq libXt-dev && apt-get clean
