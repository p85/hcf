#!/bin/bash
woc="./writeopcode.sh"
gon="./getopcodename.sh"
gol="./getopcodelength.sh"
banner="./banner.sh"
execop="./executeopcode"
$banner

# check parameters
if [ -z $1 ]
then
  echo "please specify an series of opcodes:"
  echo "$0 0xc3 0x90 0x90 0x90"
  echo "first opcode has to be 0xc3 (ret)"
  exit 1
fi

# check if ndisasm is installed
ndisasm -help > /dev/null 2>&1
if [ $? -ne 0 ]
then
  echo "ndisasm not found, please install nasm package"
  exit 1
fi

myargs=("$@")
opcode=""
prettyopcode=""
len=0
for arg in "${myargs[@]}"; do
  if [ "$arg" != "0xC3" ] && [ "$arg" != "0xc3" ]
  then
    len=$((len+1))
  fi
  opcode="$opcode $arg"
  prettyopcode="$prettyopcode$arg,"
done

#test opcode
formatted=$(echo $opcode | sed 's/0x/\\x/g' | sed 's/ //g')
$woc $formatted
currentopcodename=$($gon)
currentopcodename=$(echo $currentopcodename | rev | cut -c 2- | rev)
prettyopcode=$(echo $prettyopcode | rev | cut -c 2- | rev)
currentopcodelength=$($gol)
echo "opcode length: $currentopcodelength"
echo "executing opcode...$prettyopcode --> $currentopcodename"
trap 'if [[ $? -eq 139 ]]; then echo "segfault"; fi' EXIT
$execop $opcode
echo "the returncode was $?"
