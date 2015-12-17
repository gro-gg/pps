#!/bin/bash

# source the pps file
. pps

assertEqual() {
	if [ "$1" != "$2" ] ; then
		echo "Test failed: $3"
		echo "   : '$1' is not equal '$2'"
	fi
}

assertReturn0() {
	assertEqual $? 0 "$1"
}

assertReturn1() {
	assertEqual $? 1 "$1"
}


# tests

list="foo bar"

listcontains "$list" "f"
assertReturn1 "list contains f"

listcontains "$list" "foo"
assertReturn0 "list contains foo"

listcontains "$list" "bar"
assertReturn0 "list contains bar"

