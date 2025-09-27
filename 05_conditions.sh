#!/bin/bash

number=$1

if [ $(($number %2)) -eq 0 ]; then
    echo "given number $number is Even number"
elif [ $number -lt 0 ]; then
    echo "given number is negative number"
else
    echo "given number $number is odd number"
fi