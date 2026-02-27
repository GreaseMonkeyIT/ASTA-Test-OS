#!/bin/bash
set -e

BR_VERSION=$(cat buildroot.version)

docker run --rm -it \
    -v $(pwd):/workspace \
    buildroot-ubuntu20 \
    bash -c "
        cd /workspace &&
        git clone https://github.com/buildroot/buildroot.git &&
        cd buildroot &&
        git checkout ${BR_VERSION} &&
        make BR2_DEFCONFIG=../configs/zero2w_minimal_defconfig defconfig &&
        make -j4
    "
