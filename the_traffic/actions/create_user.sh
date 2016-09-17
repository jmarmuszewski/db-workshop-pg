rp=$(realpath "$0")
base_dir=$(dirname "$rp")
source ${base_dir}/../helpers/*.inc.sh
source ${base_dir}/../config.inc.sh

function create_user {
  read data
  curl -X POST -H "Content-Type: application/json" -d  "$data" $URL/api/users &>error.html
}


cat ${base_dir}/../../the_data/users_fixed.csv | awk -F';' '{print "{\"first_name\":\""$1"\",\"last_name\":\""$2"\",\"email\":\""$3"\",\"address1\":\""$4"\",\"address2\":\""$5"\",\"city\":\""$6"\",\"date_of_birth\":\""$7"\",\"password\":\""$8"\"}"}' | while true ; do
  read line
  source ${base_dir}/../config.inc.sh
  echo $line | mesure_time create_user  &
  sleep ${CREATE_USER_EVERY:-1}
done




# id=1
# for f in first_name last_name email addres1 address2 city date_of_birth password; do
#   echo -n '\"'
#   echo -n "$f"
#   echo -n '\"'
#   echo -n ':'
#   echo -n '\"'
#   echo -n '"'
#   echo -n "\$$id"
#   echo -n '"'
#   echo -n '\"'
#   echo -n ','
#   id=$[id+1]
# done
