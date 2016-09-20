FROM jmarmuszewski/pg-training:traffic

RUN mkdir /myapp
WORKDIR /myapp
ADD . /myapp

ENTRYPOINT /usr/bin/dumb-init /myapp/start.sh
