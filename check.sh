#!/bin/bash

read -p "Enter the 1st string: " var1
read -p "Enter the 2nd string: " var2

if [ "$var1" = "$var2" ]; then
	echo "Strings are equal :)"
else
	echo "THEY ARE NOT EQUAL :("
fi
