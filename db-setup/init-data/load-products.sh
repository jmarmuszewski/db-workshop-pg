#!/bin/bash
URL=http://localhost:3000

cat products.csv | awk -F';' '{print "{\"name\":\""$1"\",\"description\":\""$2"\",\"available\":\""$3"\"}"}'  |  while read data ; do
  curl -X POST -H "Content-Type: application/json" -d  "$data" $URL/api/products &>/dev/null
done
