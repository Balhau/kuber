FROM arm32v6/alpine

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="1.0.0"

# Maintainer
MAINTAINER Balhau <balhau@balhau.net>

RUN apk --update add curl

# Install rust
RUN curl https://sh.rustup.rs -sSf | sh

# Setup nightly builds
RUN rustup default nightly && rustup override set nightly

# Update Rust and Cargo
RUN rustup update && cargo update

# Entry point
CMD "/usr/bin/ash"