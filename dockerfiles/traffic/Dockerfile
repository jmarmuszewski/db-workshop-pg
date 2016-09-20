FROM ubuntu:16.04

RUN apt-get update -qq 
RUN apt-get install -y wget curl jq netcat \
    && wget https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64.deb \
    && dpkg -i dumb-init_*.deb
