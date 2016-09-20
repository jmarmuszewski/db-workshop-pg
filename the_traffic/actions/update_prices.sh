#!/bin/bash
rp=$(realpath "$0")
base_dir=$(dirname "$rp")
bin=${base_dir}/../bin
source ${base_dir}/../helpers/*.inc.sh
source ${base_dir}/../config.inc.sh



for i in $(seq 1 ${update_prices:-100}); do
    product=$($bin/rand.sh 1 ${ALL_PRODUCTS})
    post /api/products/$product/prices "{\"price_pln\": $RANDOM}" &>/dev/null
done
