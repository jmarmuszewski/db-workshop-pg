rp=$(realpath "$0")
base_dir=$(dirname "$rp")
data="${base_dir}/../data/products.csv"
source ${base_dir}/../helpers/*.inc.sh
source ${base_dir}/../config.inc.sh


post_data=$(shuf -n1 $data)
id=$(post /api/products "${post_data}" | jq '.id' | tr -d '"' 2>/dev/null )

post /api/products/$id/prices "{\"price_pln\": $RANDOM}" &>/dev/null