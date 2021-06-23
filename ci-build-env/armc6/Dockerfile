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
    
# Download and Install arm compiler 6 
RUN set -x \
    && wget -q https://developer.arm.com/-/media/Files/downloads/compiler/DS500-BN-00026-r5p0-18rel0.tgz \
    && tar -xzf DS500-BN-00026-r5p0-18rel0.tgz \
    && ./install_x86_64.sh --i-agree-to-the-contained-eula -d /opt/ARMCompiler6.16 -f --no-interactive \
    && rm -rf DS500-BN-00026-r5p0-18rel0.tgz install_x86_64.sh license_terms releasenotes.html \
    && : # last line
ENV PATH=/opt/ARMCompiler6.16/bin:$PATH

    
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
# Cat the manifest file to get arm compiler versions due to it fail to run without license being set 
WORKDIR $WORKDIR
RUN /bin/bash -c \
   "set -x -o pipefail \
    && python --version 2>&1 | tee env_settings \
    && git --version | tee -a env_settings \
    && aws --version | tee -a env_settings \
    && cat /opt/ARMCompiler6.16/sw/manifest.txt | grep Component | tee -a env_settings \
    && cmake --version | grep version | tee -a env_settings \
    && : # LAST LINE"
COPY env_test.sh ./env_test.sh
