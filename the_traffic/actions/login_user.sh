#!/bin/bash
rp=$(realpath "$0")
base_dir=$(dirname "$rp")
bin=${base_dir}/../bin
source ${base_dir}/../helpers/*.inc.sh
source ${base_dir}/../config.inc.sh


user=$($bin/rand.sh 1 ${ALL_USERS})
email=$(get /api/users/$user | jq '.email' | sed -e 's:@:%40:g' -e 's:\.:%2E:g' | tr -d '"')

get /api/emails/$email &>/dev/null

if [ ${feature_block_banned:-0} -eq 1 ]; then
    get /api/bans/$email 
    echo $email
fi

token=$(rand_str)
post /api/users/$user/sessions "{\"token\":\"$token\"}" &>/dev/null
