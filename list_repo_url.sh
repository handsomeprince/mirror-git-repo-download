#!/bin/bash
#Copyright (c) 2016 Prince King <wyhddzxx2@gmail.com>
#This file is under MIT license

function list_repo_url(){
	if [ $# == 0 ]
	then
#		echo "Usage: list_repo_url directory1 directory2 .. directory[n]"
		return 1
	fi
	local url_dir
	local file
	for url_dir in "$@"
	do
		for file in "$url_dir"/*_git_repo_url.txt
		do
			echo $(realpath "$file")
		done
	done
	return 0
}
