# Copyright (c) 2021 Arm Limited
# SPDX-License-Identifier: Apache-2.0

# Base Docker image
FROM ubuntu:20.04

# Set Arguments and Environment Variable
ARG WORKDIR=/root
ENV HOME=$WORKDIR
WORKDIR $WORKDIR
ENV DEBIAN_FRaONTEND=noninteractive


# Install packages via apt-get
RUN set -x \
    && apt-get -y update \
    && apt-get -y install \
      git \
      wget \
      vim \
      python3 \
      python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1 \
    && : # last line


# Install Python modules via pip3
RUN set -x \
    && pip3 install -U \
      awscli \
    && : # last line
    
    
# Download and Install arm-none-eabi-gcc
RUN set -x \
    && wget -q -O /tmp/gcc-arm-none-eabi-10-2020-q4-major.tar.bz2 https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 \
    && tar -xjf /tmp/gcc-arm-none-eabi-10-2020-q4-major.tar.bz2 -C /opt \
    && rm /tmp/gcc-arm-none-eabi-10-2020-q4-major.tar.bz2 \
    && : # last line
ENV PATH=/opt/gcc-arm-none-eabi-10-2020-q4-major/bin:$PATH


# Install updated cmake - refer https://cmake.org/install/
RUN set -x \
    && wget -q https://github.com/Kitware/CMake/releases/download/v3.20.0-rc2/cmake-3.20.0-rc2-linux-x86_64.sh \
    && chmod +x cmake-3.20.0-rc2-linux-x86_64.sh \
    && sh cmake-3.20.0-rc2-linux-x86_64.sh --exclude-subdir --prefix=/usr/local \
    && rm cmake-3.20.0-rc2-linux-x86_64.sh \
    && : # last line


# ------------------------------------------------------------------------------
# Display, check and save environment settings
# NOTE: using bash instead of Ubuntu default dash due to unsupport for pipefail
# Pipefail is crucial here, if the tools didn't install properly, docker build should not pass because of piping 
WORKDIR $WORKDIR
RUN /bin/bash -c \
   "set -x -o pipefail \
    && python --version 2>&1 | tee env_settings \
    && git --version | tee -a env_settings \
    && aws --version | tee -a env_settings \
    && arm-none-eabi-gcc --version | grep arm-none-eabi-gcc | tee -a env_settings \
    && cmake --version | grep version | tee -a env_settings \
    && : # LAST LINE"
COPY env_test.sh ./env_test.sh
