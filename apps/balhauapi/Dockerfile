FROM 10.108.252.69:5000/balhau/rust:arm32v7-0.0.2

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v7/armhf" version="0.0.4"

RUN cd /opt; git clone https://github.com/Balhau/balhauapi.git

RUN apt-get update; apt-get -y upgrade; apt-get install -y libpq-dev
RUN cd /opt/balhauapi/balhauapi; cargo build --release;

ADD start-service.sh /opt/start-service.sh
RUN chmod +x /opt/start-service.sh

# Entry point
CMD "/opt/start-service.sh"
