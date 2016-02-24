#!/bin/bash

# configure the file to test
FILE_TO_TEST=pps


# functions

debug() {
    if [ "${DEBUG}" == 1 ] ; then
        echo "  [DEBG] ${*}"
   	fi
}

info() {
    if $logInfo; then
        printf "  [\033[00;34mINFO\033[0m] $1\n"
    fi
}

warn() {
  printf "  [\033[0;33mWARN\033[0m] $1\n"
}


success() {
    printf "\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
  printf "\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
}


# assertion functions

assertEqual() {
	if [ "$1" != "$2" ] ; then
        fail "Test failed $testfile: $3"
        debug "  '$1' is not equal '$2'"
    else
        success "$testfile: $3"
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

