FROM jmarmuszewski/pg-training:web

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
ENTRYPOINT /myapp/start.sh
