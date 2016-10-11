#!/bin/bash
URL=http://localhost:3000

cat users.csv | awk -F';' '{print "{\"first_name\":\""$1"\",\"last_name\":\""$2"\",\"email\":\""$3"\",\"address1\":\""$4"\",\"address2\":\""$5"\",\"city\":\""$6"\",\"date_of_birth\":\""$7"\",\"password\":\""$8"\"}"}'  |  while read data ; do
  curl -X POST -H "Content-Type: application/json" -d  "$data" $URL/api/users
done
