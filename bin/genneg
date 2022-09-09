#!/bin/bash

if ! [ "$1" -eq "$1" ] > /dev/null || ! [ "$1" -ge 1 ] > /dev/null; then
    echo "Wrong input"
    exit 1
fi

cd ../data || exit 2

for i in $(seq 1 "$1"); do
    if [ "$i" -lt 10 ]; then
        touch "neg_0${i}_in.txt"
    else
        touch "neg_${i}_in.txt"
    fi
done
