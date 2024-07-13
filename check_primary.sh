#!/bin/bash

HOST=$(echo $3 | awk -F':' '{print $1}')
PORT=$(echo $3 | awk -F':' '{print $2}')

ROLE=$(mongo --quiet --host $HOST --port $PORT --eval 'rs.status().myState')

# MongoDB state 1 is PRIMARY
if [[ $ROLE -eq 1 ]]; then
  exit 0
else
  exit 1
fi
