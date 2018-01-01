FROM 10.108.252.69:5000/balhau/confd:arm32v6-0.0.1

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v7/armhf" version="0.0.2"

# Maintainer
MAINTAINER Balhau <balhau@balhau.net>

RUN apk update && apk upgrade && \
    apk add --no-cache curl gcc make libc-dev python g++

RUN mkdir /opt; touch /opt/rust_nigthtly_0.0.2

# Install rust
RUN curl --insecure https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y

# Setup nightly builds
ENV HOME /root
ENV PATH $HOME/.cargo/bin:$PATH

RUN rustup default nightly && rustup override set nightly

# Update Rust and Cargo
RUN rustup update

# Entry point
CMD "/usr/bin/bash"
