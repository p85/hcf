#!/bin/bash
alen=$(./getopcodelength.sh)
mylen=$1
if [ $alen -ne $mylen ]
then
  echo "length invalid"
  exit 1
fi
exit 0
