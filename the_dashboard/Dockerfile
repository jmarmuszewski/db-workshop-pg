FROM jmarmuszewski/pg-training:dashing

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
RUN bundle install
ADD . /myapp
ENTRYPOINT dashing start
