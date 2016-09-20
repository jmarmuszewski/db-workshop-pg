#!/bin/bash
rp=$(realpath "$0")
export base_dir=$(dirname "$rp")
export config=${base_dir}/config.inc.sh
source ${config}
source ${base_dir}/helpers/*.inc.sh


for action in $(ls ${base_dir}/actions/*sh); do
    action_name=$(basename $action | sed -e 's/\.sh$//g')
    echo > /data/${action_name}
done

while ! nc -z web 3000 ; do
  echo "Waiting for web"
  sleep 1
done

# sleep 20
for action in $(ls ${base_dir}/actions/*sh); do
    action_name=$(basename $action | sed -e 's/\.sh$//g')
    loop ${action_name} &
    sleep 1
done

for job in $(jobs -p); do
  wait $job
done
