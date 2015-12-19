#!/bin/bash

# configure the file to test
FILE_TO_TEST=pps


# functions

logDebug() {
    if [ "${DEBUG}" == 1 ] ; then
	    echo "[DEBUG]: ${*}" 
   	fi
}



# assertion functions

assertEqual() {
	if [ "$1" != "$2" ] ; then
		echo "Test failed $testfile: $3"
		logDebug "  '$1' is not equal '$2'"
	fi
}

assertReturn0() {
	assertEqual $? 0 "$1"
}

assertReturn1() {
	assertEqual $? 1 "$1"
}

assertEcho() {
	read echo
	assertEqual "$echo" "$1" "$2"
}

# execute tests

for t in $(ls -1 test/*) ; do
	. $FILE_TO_TEST
	testfile=$(basename "$t")
	. "$t"
done

