# Copyright (c) 2021 Arm Limited
# SPDX-License-Identifier: Apache-2.0

# Base Docker image
FROM ubuntu:20.04


# Set Arguments and Environment Variable
ARG WORKDIR=/root
ENV HOME=$WORKDIR
WORKDIR $WORKDIR
ENV DEBIAN_FRONTEND=noninteractive


# Install packages via apt-get
RUN set -x \
    && apt-get -y update \
    && apt-get -y install \
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
      lavacli \
    && : # last line


# ------------------------------------------------------------------------------
# Display, check and save environment settings
# NOTE: using bash instead of Ubuntu default dash due to unsupport for pipefail
# Pipefail is crucial here, if the tools didn't install properly, docker build should not pass because of piping
WORKDIR $WORKDIR
RUN /bin/bash -c \
   "set -x -o pipefail \
    && python --version 2>&1 | tee env_settings \
    && lavacli --version | tee -a env_settings \
    && : # LAST LINE"
COPY env_test.sh ./env_test.sh


# Metadata
LABEL maintainer='Qinghao Shi <qinghao.shi@arm.com>'

