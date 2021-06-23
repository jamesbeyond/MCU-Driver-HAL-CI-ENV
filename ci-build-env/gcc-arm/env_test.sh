#!/bin/bash -x
# Copyright (c) 2021 Arm Limited
# SPDX-License-Identifier: Apache-2.0

# This file will be copied inside docker image

# Tests for ci-build-env:gcc-arm docker image
echo Compile Hello World
wget -q https://github.com/gcc-mirror/gcc/raw/releases/gcc-11.1.0/libgo/go/debug/elf/testdata/hello.c
arm-none-eabi-gcc -v -time -c hello.c