#!/bin/sh
#Author: Emmanuel Torres Rios

dir=$1
text=$2
arguments=$#

dir_check(){
    test1=$(echo $1 |tr -dc '/' | wc -c)
    if [ $test1 -lt 1 ]; then
    echo "FAILED: ${1} is not a path..."
    exit 1
    a=0
    else
    echo "The path ${1} is being analyzed"
    a=10
    fi
    return $a
}

if [ $# -gt 2 ]; then
    echo "FAILED: You need only two arguments, instead you write ${arguments}..."
elif [ $# -eq 2 ]; then
    echo "Seraching in: ${dir} for elements with: ${text}"
    test=$dir
    dir_check $test
    check=$?
    if [ $check -eq 10 ]; then
    echo $text >> $dir    
    echo "DONE"
    else
    echo "BAD"
    fi
else
        echo "FAILED: You need /path/to/archive and write_text"
        exit 1
fi