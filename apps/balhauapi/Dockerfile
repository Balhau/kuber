FROM 10.108.252.69:5000/balhau/rust:arm32v7-0.1.2

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v7/armhf" version="0.0.28"

RUN cd /opt; git clone https://github.com/Balhau/balhauapi.git

RUN apt-get update; apt-get -y upgrade; apt-get install -y pkg-config libssl-dev libpq-dev libsqlite3-dev libsqlite3-0 cmake zlib1g-dev

RUN apt-get install -y youtube-dl

# Runtime variables needed
ENV DATABASE_URL postgres://postgres:postgres@10.100.70.141/balhauapi
ENV CONFIG_FILE_ENV=/opt/config.yml

ADD config.yml /opt/config.yml

#Remove the specific version as soon as ring lib is stable
#RUN cd /opt/balhauapi/balhauapi; rustup install nightly-2017-12-21 && rustup override set nightly-2017-12-21; cargo install --root /opt; cargo clean
RUN cd /opt/balhauapi/balhauapi; cargo install --root /opt; cargo clean

ADD start-service.sh /opt/start-service.sh
RUN chmod +x /opt/start-service.sh


VOLUME /opt/media/balhauwd/download

# Entry point
CMD "/opt/start-service.sh"
