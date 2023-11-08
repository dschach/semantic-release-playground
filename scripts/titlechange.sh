#!/bin/bash

TITLE="my:new car"

awk '{ split($0, arr, ":"); print arr}

newTitle="{0}({1}):{2}"

awk -F: '{print {1} "(" $TITLE "): "{2}}' new

IFS=' ' read -ra strarr <<< "$TITLE"
#IFS=' '; strarr=($TITLE); unset IFS;
echo "${strarr[0]}"
echo "hello"
for i in "${strarr[@]}"
do
    echo $i
done

#gh pr edit --title format($newTitle, ${strarr[0]}, ${strarr[1]}, ${strarr[2]})
echo format($newTitle, ${strarr[0]}, ${strarr[1]}, ${strarr[2]})