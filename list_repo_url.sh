#!/bin/bash
function list_repo_url(){
	for line in $(ls $1/*_repo_url.txt)
	do
		echo $line
	done
}
