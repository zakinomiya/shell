#!/bin/bash

baseurl="https://github.com"

s="abcdefghijklmnopqrstuvwz"
b="ABCDEFGHIJKLMNOPQRSTUVWZ"
n="0123456789"

function request () {
  local a1=$(echo "${1}" | fold -w1)
  local a2=$(echo "${1}" | fold -w1)
  
  for c1 in $a1; do
    for c2 in $a2; do
      status_code=$(curl -o /dev/null -s -w "%{http_code}" "${baseurl}/${c1}${c2}")   
      if [ $status_code != 200 ];then
        echo "username ${c1}${c2} is not used"
      fi
    done
  done
   
}


echo "s s"
request $s $s

echo "b b"
request $b $b

echo "n n"
request $n $n

echo "s b"
request $s $b

echo "s n"
request $s $n

echo "b n"
request $b $n

