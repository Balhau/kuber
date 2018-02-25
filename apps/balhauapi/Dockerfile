FROM 10.108.252.69:5000/balhau/rust:arm32v7-0.0.8

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v7/armhf" version="0.0.16"

RUN cd /opt; git clone https://github.com/Balhau/balhauapi.git

RUN apt-get update; apt-get -y upgrade; apt-get install -y pkg-config libssl-dev libpq-dev libsqlite3-dev libsqlite3-0

#Remove the specific version as soon as ring lib is stable
#RUN cd /opt/balhauapi/balhauapi; rustup install nightly-2017-12-21 && rustup override set nightly-2017-12-21; cargo install --root /opt; cargo clean
RUN cd /opt/balhauapi/balhauapi; rustup install nightly-2017-12-21 && rustup override set nightly-2017-12-21; cargo install --root /opt; cargo clean

ADD start-service.sh /opt/start-service.sh
RUN chmod +x /opt/start-service.sh

RUN apt-get install -y youtube-dl

# Runtime variables needed
ENV DATABASE_URL postgres://postgres:postgres@192.168.1.14/postgres
ENV CONFIG_FILE_ENV=/opt/config.yml

ADD config.yml /opt/config.yml

VOLUME /opt/media

# Entry point
CMD "/opt/start-service.sh"
