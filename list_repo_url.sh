#!/bin/bash
#Copyright (c) 2016 Prince King <wyhddzxx2@gmail.com>
#This file is under MIT license

function list_repo_url(){
	if [ $# == 0 ]
	then
#		echo "Usage: list_repo_url directory1 directory2 .. directory[n]"
		return 1
	fi
	local url_dirs="$@"
	local url_dir
	for url_dir in ${url_dirs[@]}
	do
		for line in $(ls $url_dir/*_git_repo_url.txt 2>/dev/null)
		do
			echo $line
		done
	done
	return 0
}
