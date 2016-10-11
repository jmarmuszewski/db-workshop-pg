#!/bin/bash
source randoms.inc.sh
URL=http://localhost:3000


for user in $(seq 24411 200171); do
    num=$(rand_int 2 10)
    echo "U: $user, N: $num"
    for i in $(seq 1 $num); do
        token=$(rand_str)
	curl -X POST -H "Content-Type: application/json" -d  "{\"token\":\"$token\"}" $URL/api/users/$user/sessions &>/dev/null
    done
done
