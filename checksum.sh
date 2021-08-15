#!/bin/bash

getchecksum() {
	if [ "$1" -eq 1 ]; then
		sha1sum $2 | awk '{print $1}'
	elif [ "$1" -eq 2 ]; then
		sha224sum $2 | awk '{print $1}'
	elif [ "$1" -eq 3 ]; then
		sha256sum $2 | awk '{print $1}'
	elif [ "$1" -eq 4 ]; then
		sha384sum $2 | awk '{print $1}'		
	elif [ "$1" -eq 5 ]; then
		sha512sum $2 | awk '{print $1}'
	elif [ "$1" -eq 6 ]; then
		md5sum $2 | awk '{print $1}'
	else
		echo "Wrong choice. Try again"
		return 
	fi
}

if [ -z "$1" ]; then
	echo "Please pass in one argument before running the script and try again"
	exit
fi

echo "===== CHECKSUM ====="
echo "1. Verify sha1sum"
echo "2. Verify sha224sum"
echo "3. Verify sha256sum"
echo "4. Verify sha384sum"
echo "5. Verify sha512sum"
echo "6. Verify md5sum"
read -p "Enter your choice (1 to 6):" choice
echo "Please wait...Larger files may take some time"
current_checksum="$(getchecksum $choice $1)"
case $choice in 
	1)
		read -p "Enter sha1sum:" user_checksum
		;;
	2)
		read -p "Enter sha224sum:" user_checksum
		;;
	3)
		read -p "Enter sha256sum:" user_checksum
		;;
	4)
		read -p "Enter sha384sum:" user_checksum
		;;
	5)
		read -p "Enter sha512sum:" user_checksum
		;;
	6)
		read -p "Enter md5sum:" user_checksum
		;;
	*)
		echo "OOPS"
esac
red='\033[1;31m'
green='\033[1;32m'
nc='\033[0m'

if [ "$current_checksum" == "$user_checksum" ]; then
	echo -e "${green} Verified Successfully :) :) :) :) ${nc}"
else
	echo -e "${red} ERROR: NOT VERIFIED ${nc}"
fi
