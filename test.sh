#!/bin/bash

# source the pps file
. pps

assertEqual() {
	if [ "$1" != "$2" ] ; then
		echo "Test failed: $3"
		echo "   : '$1' is not equal '$2'"
	fi
}


# tests

list="foo bar"

listcontains "$list" "f"
assertEqual $? 1 "list contains f"

listcontains "$list" "foo"
assertEqual $? 0 "list contains foo"

listcontains "$list" "bar"
assertEqual $? 0 "list contains bar"

