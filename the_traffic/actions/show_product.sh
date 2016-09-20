#!/bin/bash
rp=$(realpath "$0")
base_dir=$(dirname "$rp")
bin=${base_dir}/../bin
source ${base_dir}/../helpers/*.inc.sh
source ${base_dir}/../config.inc.sh



product=$($bin/rand.sh 1 ${ALL_PRODUCTS})
get /api/products/$product &>/dev/null

if [ ${feature_prices_history:-0} -eq 1 ]; then
    get /api/products/$product/prices &>/dev/null
fi

if [ ${feature_logged_only:-0} -eq 1 ]; then
    session=$(rand_str)
    get /api/sessions/$session &>/dev/null
fi
