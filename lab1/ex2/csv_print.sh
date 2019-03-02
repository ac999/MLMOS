#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "No argument given;"
	echo "$(basename $0) file.csv"
	exit 1
fi

for i in $(seq 1 5); do
	echo $(cut -d , -f $i $1)
done
