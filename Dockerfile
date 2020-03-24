FROM debian
MAINTAINER APN
RUN apt-get update -y -qq
RUN apt-get install -y -qq latexmk texlive-full
RUN apt-get clean
