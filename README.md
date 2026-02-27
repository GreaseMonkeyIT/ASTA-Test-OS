# Raspberry Pi Zero 2 W -- Custom Buildroot Linux (64-bit)

## Overview

This repository contains a fully reproducible Buildroot-based Linux
distribution for the Raspberry Pi Zero 2 W (arm).

The system provides:

-   32-bit ARMv7 userspace (ARMv7-A)
-   Bootlin external glibc toolchain
-   Custom Raspberry Pi kernel (bcm2711-based)
-   Xorg + Fluxbox lightweight window manager
-   Qt5 support
-   OpenCV 4 (with contrib modules)
-   libcamera (RPI VC4 pipeline enabled)
-   Python 3 environment
-   Flask + Uvicorn backend
-   SSH access (Dropbear)
-   WiFi support (wpa_supplicant + dhcpcd)
-   Package management via opkg (GPG enabled)


## Target Hardware

-   Board: Raspberry Pi Zero 2 W
-   SoC: BCM2710A1 (Cortex-A53)
-   Architecture: ARMv7-A (32-bit)
-   FPU: VFPv4


## Toolchain

-   Provider: Bootlin
-   Architecture: arm
-   C Library: glibc (stable)
-   CCache enabled


## Kernel

-   Source: Raspberry Pi Linux (custom tarball)
-   Kernel defconfig: bcm2711
-   Device Tree: broadcom/bcm2710-rpi-zero-2-w
-   Firmware: RPI firmware (Pi variant)
-   Custom firmware config: zero2w_minimal_defconfig.txt


## Graphics Stack

-   Mesa3D
-   Xorg server
-   Fluxbox window manager
-   XTerm
-   XEyes (test utility)
-   Qt5


## Camera & Vision Stack

libcamera: - RPI VC4 pipeline enabled - V4L2 support - Python bindings
enabled

OpenCV 4: - Python bindings enabled - JPEG support - PNG support - V4L
support - Contrib modules enabled

x264: - CLI enabled


## Python & Backend

-   Python 3 (Python-only build)
-   Flask
-   Uvicorn
-   RPi.GPIO
-   pip available


## Networking

-   wpa_supplicant (WiFi)
-   dhcpcd (DHCP client)
-   Dropbear (SSH server)
-   brcm_patchram_plus (Bluetooth firmware support)
-   GLib networking


## Filesystem

-   Root filesystem: ext4
-   Size: 154 MB
-   Generated via genimage
-   SD card image generated automatically


## Reproducible Build Instructions

### Requirements

-   Docker
-   Git

### Build

docker build -t buildroot-ubuntu20 .

docker run --rm -it\
-v \$(pwd):/workspace\
buildroot-ubuntu20\
bash -c " cd /workspace && git clone
https://github.com/buildroot/buildroot.git && cd buildroot && git
checkout 2024.11 && make
BR2_DEFCONFIG=../configs/rpi_zero2w_opencv_defconfig_backup defconfig &&
make -j4 "

Generated image:

buildroot/output/images/sdcard.img

Flash using:

sudo dd if=sdcard.img of=/dev/sdX bs=4M status=progress sync


## Repository Structure

. ├── Dockerfile ├── README.md ├── configs/ │ └──
rpi_zero2w_opencv_defconfig_backup ├── buildroot.version └── build.sh


## Intended Use Cases

-   Camera-based embedded vision systems
-   Remote monitoring devices
-   Edge image processing nodes
-   Lightweight GUI-enabled embedded systems
