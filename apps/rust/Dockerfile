FROM arm32v7/debian

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="1.0.0"

# Maintainer
MAINTAINER Balhau <balhau@balhau.net>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl build-essential git

# Install rust
RUN curl --insecure https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y

# Setup nightly builds
ENV HOME /root
ENV PATH $HOME/.cargo/bin:$PATH

RUN rustup default nightly && rustup override set nightly

# Update Rust and Cargo
RUN rustup update
RUN cargo update

# Entry point
CMD "/usr/bin/bash"
