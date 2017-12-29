FROM 10.108.252.69:5000/balhau/rust:arm32v7-0.0.4

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v7/armhf" version="0.0.12"

RUN cd /opt; git clone https://github.com/Balhau/balhauapi.git

RUN apt-get update; apt-get -y upgrade; apt-get install -y libpq-dev; apt-get install -y libsqlite3-dev; apt-get install libsqlite3-0

#Remove the specific version as soon as ring lib is stable
RUN cd /opt/balhauapi/balhauapi; rustup install nightly-2017-12-21 && rustup override set nightly-2017-12-21; cargo install --root /opt; cargo clean

ADD start-service.sh /opt/start-service.sh
RUN chmod +x /opt/start-service.sh

ENV ROCKET_ADDRESS 0.0.0.0

# Entry point
CMD "/opt/start-service.sh"
