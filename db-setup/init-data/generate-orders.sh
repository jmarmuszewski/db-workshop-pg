#!/bin/bash
source randoms.inc.sh
URL=http://localhost:3000



for user in $(seq 1 200171); do
    for i in $(seq 1 $(rand_int 1 5)); do
	if [ $(rand_int 0 1000) -eq 0 ]; then
	    finalized="false"
	else
	    finalized="true"
	fi
        id=$(curl -X POST -H "Content-Type: application/json" -d  "{\"document_name\":\"FW/$user/$i\",\"finalized\":\"$finalized\"}" -q $URL/api/users/$user/orders 2>/dev/null| jq '.id')
        
        for j in $(seq 1 $(rand_int 1 10)); do
    	    price=$(./rand.sh 1 3093960)
    	    quantity=$(./rand.sh 1 100)
    	    discount=$(./rand.sh 1 10)    
    	    curl -X POST -H "Content-Type: application/json" -d  "{\"price\":\"$price\",\"quantity\":\"$quantity\",\"discount\":\"$discount\"}" $URL/api/users/$user/orders/$id/items &>/dev/null
        done
    done
    echo $user
done
