#!/bin/bash
rp=$(realpath "$0")
base_dir=$(dirname "$rp")
source ${base_dir}/config.inc.sh

for action in $(ls ${base_dir}/actions/*sh); do
  ${action} &
done

for job in $(jobs -p); do
  wait $job
done
