FROM 10.108.252.69:5000/balhau/confd:arm32v6-0.0.1

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v7/armhf" version="0.0.2"

# Maintainer
MAINTAINER Balhau <balhau@balhau.net>


RUN apk update && apk upgrade && \
    apk add --no-cache bash file sudo curl libc6-compat libc-dev gcc make python g++

#--default-toolchain nightly -y
RUN bash; curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- -y

# Setup nightly builds
ENV HOME /root
ENV PATH $HOME/.cargo/bin:$PATH

#RUN rustup default nightly && rustup override set nightly

# Update Rust and Cargo
#RUN rustup update

# Entry point
CMD "/usr/bin/ash"
