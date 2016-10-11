function rand_int {
    min=${1:-0}
    max=${2:-32767}
    mod=$((1 + max-min))
    echo $((($RANDOM % mod) + min))
}

function rand_str {
    date +%s%N | sha256sum | base64 | head -c 32 ; echo
}


