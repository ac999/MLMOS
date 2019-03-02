#!/bin/bash

field=""

if [[ $# -ne 1 ]]; then
	echo "No argument given;"
	echo "$(basename $0) file.csv"
	exit 1
fi
while read line; do
	for i in $(seq 1 5); do
		if [[ $i -eq "1" ]]; then
			field="Host: "
		elif [[ $i -eq "2" ]]; then
			field="IP: "
		elif [[ $i -eq "3" ]]; then
			field="Web: "
		elif [[ $i -eq "4" ]]; then
			field="Backend: "
		elif [[ $i -eq "5" ]]; then
			field="Database: "
		fi
		echo $field$(echo $line | cut -d , -f $i)
	done
	echo --------------------
done < $1
