FROM ruby:2.3.1
RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev curl netcat \
    && curl -sL https://deb.nodesource.com/setup_5.x | bash - \
    && apt-get install -y nodejs
