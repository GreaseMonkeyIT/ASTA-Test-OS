FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    build-essential \
    git \
    wget \
    curl \
    unzip \
    rsync \
    bc \
    bison \
    flex \
    texinfo \
    help2man \
    gawk \
    libncurses5-dev \
    libssl-dev \
    python3 \
    file \
    patch \
    cpio \
    xz-utils \
    zstd \
    ca-certificates \
    sudo

# Create build user
RUN useradd -m builder
USER builder
WORKDIR /home/builder

CMD ["/bin/bash"]
