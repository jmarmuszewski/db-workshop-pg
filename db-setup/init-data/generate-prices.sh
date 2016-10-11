#!/bin/bash
source randoms.inc.sh
URL=http://localhost:3000


for product in $(seq 1 103000); do
    num=$(rand_int 10 50)
    echo "U: $product, N: $num"
    price=$(rand_int 2000 20000)
    for i in $(seq 1 $num); do
        price=$(rand_int $(($price - 100)) $((price + 100)))
        curl -X POST -H "Content-Type: application/json" -d  "{\"price_pln\":\"$price\"}" $URL/api/products/$product/prices &>/dev/null
    done
done
