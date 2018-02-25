FROM arm32v7/debian

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v7/armhf" version="0.0.8"

# Maintainer
MAINTAINER Balhau <balhau@balhau.net>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl build-essential git

RUN touch /opt/rust_nigthtly_0.0.2

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
