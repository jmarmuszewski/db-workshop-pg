#!/bin/bash
rp=$(realpath "$0")
base_dir=$(dirname "$rp")
source ${base_dir}/../helpers/*.inc.sh
source ${base_dir}/../config.inc.sh





case ${send_spam_method:-1} in
    1) get /api/emails_a $>/dev/null ;;
    2) get /api/emails_b $>/dev/null ;;
esac


