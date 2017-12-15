FROM 10.108.252.69:5000/balhau/rust:arm32v7-0.0.1

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v7/armhf" version="1.0.0"

RUN cd /opt; git clone https://github.com/Balhau/balhauapi.git

ADD start-service.sh /opt/start-service.sh
RUN chmod +x start-service.sh

# Entry point
CMD "/usr/bin/bash"
