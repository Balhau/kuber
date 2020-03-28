FROM arm32v6/alpine

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="0.0.3"

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh python python-dev py2-pip build-base

RUN git clone https://github.com/Balhau/bbbeauty-template.git

WORKDIR bbbeauty-template

CMD ["python", "-m", "SimpleHTTPServer","8000"]
