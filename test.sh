#!/bin/bash
source list_repo_url.sh
for repo_url_file in `list_repo_url $1`
do
	echo $repo_url_file
	echo "------------------------------"
	for url in `cat $repo_url_file`
	do
		echo $url
	done
done
