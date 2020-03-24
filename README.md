# jaschac/debian-gcc
#### Table of Contents
1. [Overview](#overview)
2. [Image Description](#image-description)
    * [Why an Image with gcc and make](#why-an-image-with-gcc-and-make)
3. [Setup](#setup)
    * [Pulling from the Docker Hub](#pulling-from-the-docker-hub)
    * [Building the Image from the Source](#building-the-image-from-the-source)
4. [Usage](#usage)

### Overview
This image provides a Debian Jessie with the GNU's gcc and make installed.

### Image Description
The jaschac/debian-gcc image is:

 1. Built on top of the **official Debian Jessie** (debian:jessie) available through the Docker Hub.
 2. Installs **gcc** and **make** through APT.
 3. Meant to be used as a base image.

The jaschac/debian-gcc:

 - **Does NOT** provide any service.
 - **Does NOT** provide any other package but those that ship with debian:jessie. This means that, for example, none of the following packages is available:
	 - curl
	 - gdb
	 - python
	 - valgrind
	 - vi
	 - wget

#### Why an Image with gcc and make
The reason behind the jaschac/debian-gcc is very simple: the official **debian:jessie image does not provide any kind of tool to build from the source**, still, **sometimes**, we are working behind a proxy and **our containers can't pull from APT**. Well, they can if we **expose our credentials to APT**, which is far from being secure.

A solution to this is to deploy an image that is able to build from the source a small piece of software that allows containers to **get through the proxy without exposing plain text credentials**.

The GNU Foundation provides an **official gcc image** on the Docker Hub. This image weights some **1100 MB** and provides an exhaustive collection of tools to build source code of different programming languages. This is great but sometimes **overkill**.

The jaschac/debian-gcc image is thus **meant to be used as a base image** whenever we simply need a **lightweight** container able to build C code.

### Setup
There are two ways to get and use the jaschac/debian-gcc image:

#### Pulling from the Docker Hub
The jaschac/debian-gcc image can be easily pulled from the Docker Hub:

```bash
$ sudo docker pull jaschac/debian-gcc
```

#### Building the Image from the Source
jaschac/debian-gcc's source code can be freely pulled from GitHub and used to build an image.

```bash
$ git clone git@github.com:jaschac/docker-debian-gcc.git debian-gcc
```

 Once pulled, the image will have the following structure:
```bash
debian-gcc/
├── Dockerfile
├── LICENSE
├── metadata.json
├── README
└── README.md
```

The jascha/debian-gcc image then can be built with the following command:

```bash
$ sudo docker build -t jaschac/debian-gcc -f debian-gcc/Dockerfile debian-gcc/
Successfully built 85cc9061f39f
$ sudo docker images
REPOSITORY                TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
jaschac/debian-gcc        latest              85cc9061f39f        2 minutes ago       226.4 MB
```

## Usage
The jaschac/debian-gcc is meant to be used as base image, not to be run. Still, it a container can be easily launched in interactive mode with a Bash shell ready to play and test it.
```bash
sudo docker run --rm=true -it jaschac/debian-gcc /bin/bash
```
If run in deamon mode, it will immediately stop with exit code 0.

