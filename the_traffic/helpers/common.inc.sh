function raport_time {
  action=$(basename $0 | sed -e 's/.sh$//')
  echo "Execution time: $1ms for action: $action"
}

function mesure_time {
  start=$(date +%s%N)
  "$@"
  raport_time $((($(date +%s%N)-start)/1000000))
}
