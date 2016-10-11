#!/bin/bash
source randoms.inc.sh
URL=http://localhost:3000

user=$(rand_int 1 100)

while [ $user -lt 200171 ]; do
    reason=""
    for i in $(seq 1 $(rand_int 1 5)); do
        reason="$reason$(rand_str)"
    done
    curl -X POST -H "Content-Type: application/json" -d  "{\"reason\":\"$reason\"}" $URL/api/users/$user/bans &>/dev/null
    echo $user
    user=$((user + $(rand_int 10 30)))
done

exit 0
