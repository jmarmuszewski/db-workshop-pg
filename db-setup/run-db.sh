#!/bin/bash

docker build  -t pgjm .
docker run -p 5432:5432 -it pgjm
