#!/bin/bash
rp=$(realpath "$0")
base_dir=$(dirname "$rp")
bin=${base_dir}/../bin
source ${base_dir}/../helpers/*.inc.sh
source ${base_dir}/../config.inc.sh


case ${browse_catalog_method:-1} in
    1) get /api/products &>/dev/null ;;
    2) echo "Not available" ;;
esac

if [ ${feature_logged_only:-0} -eq 1 ]; then
    session=$(rand_str)
    get /api/sessions/$session &>/dev/null
fi
