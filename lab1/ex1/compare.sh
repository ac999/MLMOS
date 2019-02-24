#!/bin/bash

compareDir(){

	local dir1=$(pwd $1)
	local dir2=$(pwd $2)
	local struct1=$(dir "$dir1/$1")
	local struct2=$(dir "$dir2/$2")
	if [[ "$struct1" != "$struct2" ]]; then
		echo "Directory structure differs;"
		exit 0
	else
		cd $1
		for fileName in *; do
			[ -e "$fileName" ] || continue	
			local file1Path="$dir1/$1/$fileName"
			local file2Path="$dir2/$2/$fileName"
			if [[ $(diff $file1Path $file2Path | wc -l) -ne 0 ]]; then
				echo "File \"$file1Path\" differs from \"$file2Path\""
			fi	
						
		done
		
	fi

}

if [[ $# -ne 2 ]]; then
	echo "$(basename $0) DIRECTOR1 DIRECTOR2"
	exit 1
else
	compareDir $1 $2
fi
