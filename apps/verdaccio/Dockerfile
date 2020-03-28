#FROM 10.108.252.69:5000/balhau/nodejs:armv6-1.1.0
FROM node:alpine

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="0.0.3"

RUN apk update && apk upgrade

RUN npm install -g verdaccio


CMD ["verdaccio","-l","0.0.0.0:4873"]
