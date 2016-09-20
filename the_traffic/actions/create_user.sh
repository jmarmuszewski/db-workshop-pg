#!/bin/bash
rp=$(realpath "$0")
base_dir=$(dirname "$rp")
data="${base_dir}/../data/users.csv"
source ${base_dir}/../helpers/*.inc.sh
source ${base_dir}/../config.inc.sh


post_data=$(shuf -n1 $data)
post /api/users "${post_data}" &>/dev/null
