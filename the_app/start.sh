#!/bin/bash

while ! nc -z db 5432 ; do
  echo "Waiting for db"
  sleep 1
done

bundle exec rails db:migrate
bundle exec rails s -p 3000 -b '0.0.0.0'
