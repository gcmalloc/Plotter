#!/bin/bash
PLOT=''
for i in "$@"; do
	#rapid check if the file exist
	if [[ ! -f "$i" ]]; then
		echo ignoring "$i" >&2
		continue
	fi
	#first iteration is special
	if [[ -z $PLOT ]]; then 
	PLOT=$(echo "'$i'")
	else 
 	PLOT=$(echo "${PLOT}", "'${i}'")
	fi
done
if [[ -z $PLOT ]]; then
	echo "No valid argument, exiting"
	exit 1
fi
gnuplot -e "plot $PLOT" --persist
