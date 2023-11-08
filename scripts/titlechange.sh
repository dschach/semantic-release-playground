#!/bin/bash

TITLE="deps: Bump eslint from 8.52.0 to 8.53.0 (PR #42)"

awk '{ split($0, arr, ":"); print arr}'

newTitle="{0}({1}):{2}"

packageName = "eslint"

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