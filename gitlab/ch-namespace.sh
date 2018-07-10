#!/bin/bash

NAMESPACE=gitlab
ADDITION="namespace:"
TO="namespace: $NAMESPACE"
FILES="$(find ./ -name '*.yaml' -type f)"

for FILE in $FILES; do
  echo $FILE
  IF0=$(cat $FILE | grep "$ADDITION")
  if [ -z "$IF0" ]; then
    echo "$(date) - [WARN] - no namespace filed found, add a namespace first!"
    exit 1
  else
    sed -i "/$ADDITION/ c {{.placeholder}}  $TO" $FILE
    sed -i s"/{{.placeholder}}//g" $FILE
  fi
done
