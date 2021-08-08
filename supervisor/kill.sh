#!/bin/sh

echo "READY";

while read line; do
  echo "Processing Event: $line" >&2;
  kill $(cat /supervisord.pid)
done < /dev/stdin
