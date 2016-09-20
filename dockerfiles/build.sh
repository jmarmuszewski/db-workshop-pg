#!/bin/bash
_PWD=$PWD
for d in * ; do
    if [ -d ${_PWD}/$d ]; then
        cd ${_PWD}/$d
        docker build . -t jmarmuszewski/pg-training:$d
        docker push jmarmuszewski/pg-training:$d
    fi
done
