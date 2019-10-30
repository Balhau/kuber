# Multistage balhauapi docker image
# Download and compile the rust source code
FROM 10.108.252.69:5000/balhau/rust:arm32v7-0.1.5 AS builder

RUN cd /opt; git clone https://github.com/Balhau/balhauapi.git

RUN apt-get update; apt-get -y upgrade; apt-get install -y pkg-config libssl-dev libpq-dev libsqlite3-dev libsqlite3-0 cmake zlib1g-dev

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl


# Runtime variables needed
ENV DATABASE_URL postgres://postgres:postgres@10.109.150.18/balhauapi
ENV CONFIG_FILE_ENV=/opt/config.yml

ADD config.yml /opt/config.yml

RUN rustup update


#Remove the specific version as soon as ring lib is stable
RUN cd /opt/balhauapi/balhauapi; rustup install nightly-2017-12-21 && rustup override set nightly-2017-12-21; cargo install --root /opt; cargo clean
RUN cd /opt/balhauapi/balhauapi; cargo install --root /opt --path .; cargo clean

ADD start-service.sh /opt/start-service.sh
RUN chmod +x /opt/start-service.sh

# Entry point
#CMD "/opt/start-service.sh"


## Copy the binaries, configuration files and init script
FROM arm32v7/debian

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v7/armhf" version="0.0.32"

WORKDIR /opt

ENV DATABASE_URL postgres://postgres:postgres@10.109.150.18/balhauapi
ENV CONFIG_FILE_ENV=/opt/config.yml

VOLUME /opt/media/balhauwd/download
COPY --from=builder /opt/bin/ bin 
COPY --from=builder /opt/start-service .
COPY --from=builder /opt/config.yml .

# Entry point
CMD "/opt/start-service.sh"
