#!/usr/bin/env bash
# wait-for-it.sh

# Copyright (c) 2014-2017 Vishnu Bob. Released under the MIT License.

TIMEOUT=15
QUIET=0
HOST="$1"
PORT="$2"
shift 2
CMD="$@"

usage() {
    echo "Usage: $0 host:port [-t timeout] [-- command args]"
    exit 1
}

# check for options
while [[ $# -gt 0 ]]
do
    case "$1" in
        -t)
            TIMEOUT="$2"
            shift 2
            ;;
        -q)
            QUIET=1
            shift
            ;;
        *)
            break
            ;;
    esac
done

# wait for the host to become available
echo "Waiting for $HOST:$PORT..."
START=$(date +%s)
while ! nc -z $HOST $PORT; do
    sleep 1
    END=$(date +%s)
    DIFF=$(( $END - $START ))
    if [ $DIFF -gt $TIMEOUT ]; then
        echo "$HOST:$PORT is still not available after waiting $TIMEOUT seconds."
        exit 1
    fi
done

if [ $QUIET -eq 0 ]; then
    echo "$HOST:$PORT is available!"
fi

# Execute the command if provided
if [ -n "$CMD" ]; then
    exec $CMD
fi
