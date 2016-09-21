function raport_time {
  action=$1
#  curl -d "{ \"auth_token\": \"db-worksops\", \"current\": $2 }" http://dashing:3030/widgets/$action
  echo $2 >> /data/$action
  echo "Execution time: ${2}ms for action: $action"
}

function mesure_time {
  action=$1
  shift 
  start=$(date +%s%N)
  "$@"
  raport_time ${action} $((($(date +%s%N)-start)/1000000))
}


function get {
    curl -X GET --max-time ${timeout:-10} -H "Content-Type: application/json" ${URL}${1} 2>/dev/null #&>error.html
}

function post {
    curl -X POST --max-time ${timeout:-10} -H "Content-Type: application/json" -d  "$2" ${URL}/${1} 2>/dev/null #&>error.html
}


function loop {
    while true ; do
        action=$1
        source ${config}
        skip=$(eval "echo \${${action}_skip}")
       if [ $(jobs -p | wc -l) -gt ${max_threads:-2} ] || [ ${skip:-1} -eq 1 ] ; then
          echo "Skipping execution of ${action}: $(jobs -p | wc -l)"        
       else    
          mesure_time ${action} ${base_dir}/actions/${action}.sh  &
       fi
        delay=$(eval "echo \${${action}_every}")
        sleep ${delay:-10}
    done
}

function rand_str {
    date +%s%N | sha256sum | base64 | head -c 32 ; echo
}