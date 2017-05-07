#!/bin/bash
#Copyright (c) 2016 Prince King <wyhddzxx2@gmail.com>
#This file is under MIT license

_split_string=""
function split_common(){
	local string=$1
	pre_IFS=$IFS
	IFS=$2
	_split_string=($string)
	IFS=$pre_IFS
	#echo ${split_string[*]}
	return 0
}
function split(){
	if [ $# != 3 ]
	then
		#echo "Usage: split split_string filter_char index"
		return 1
	fi
	# local string=$1
	# pre_IFS=$IFS
	# IFS=$2
	# local split_string=($string)
	# IFS=$pre_IFS
	# local array_count=${#split_string[@]}
	# local array_lbound=0
	# local array_ubound=$(($array_count-1))
	#local split_string=($(split_common $1 $2))
	split_common $1 $2
	local array_count=${#_split_string[@]}
	if [ $3 -gt $array_count -o $3 -lt 1 ]
	then
		return 255
	else
		echo ${_split_string[(($3 - 1))]}
		return 0
	fi
}
#split https://git.gnome.org/browse/adwaita-icon-theme "/" 3 4
function getCount(){
	if [ $# != 2 ]
	then
		#echo "Usage: getCount split_string filter_char"
		return 1
	fi
	# local string=$1
	# pre_IFS=$IFS
	# IFS=$2
	# local split_string=($string)
	# IFS=$pre_IFS
	split_common $1 $2
	#local split_string=($(split_common $1 $2))
	local array_count=${#_split_string[@]}
	echo $array_count
	return 0
}
function getUBound(){
	if [ $# != 2 ]
	then
		#echo "Usage: getUBound split_string filter_char index"
		return 1
	fi
	local array_count=`getCount $1 $2`
	local array_ubound=$(($array_count-1))
	echo $array_ubound
	return 0
}
function getLBound(){
	echo 0
	return 0
}
function cutString(){
	return 0
}