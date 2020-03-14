# base image
FROM node:12.2.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

RUN apk add git

RUN echo "1"
RUN git clone https://github.com/Balhau/react-demo /app

# install and cache app dependencies
#Install front end
RUN npm install
RUN yarn build

#Add server
RUN yarn global add serve

# start app
CMD ["serve", "-s", "build"]
#CMD ["tail", "-f", "/app/README.md"]
