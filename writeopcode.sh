#!/bin/bash
if [ -z $1 ]
then
  echo "no opcode specified"
  exit 1
fi
echo -n -e $1 > __tempopcode
