#!/bin/bash
#Copyright (c) 2016 Prince King <wyhddzxx2@gmail.com>
#This file is under MIT license

function split(){
	if [ $# != 3 ]
	then
		#echo "Usage: split split_string filter_char index"
		return 1
	fi
	local string=$1
	pre_IFS=$IFS
	IFS=$2
	local split_string=($string)
	IFS=$pre_IFS
	local array_count=${#split_string[@]}
	local array_lbound=0
	local array_ubound=$(($array_count-1))
	if [ $3 -gt $array_count -o $3 -lt 1 ]
	then
		return 255
	else
		echo ${split_string[(($3 - 1))]}
		return 0
	fi
}
#split https://git.gnome.org/browse/adwaita-icon-theme "/" 3 4