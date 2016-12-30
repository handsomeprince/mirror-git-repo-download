#!/bin/bash
set -e
set -o pipefail
source split.sh
source list_repo_url.sh
download_script_dir=`dirname $(realpath $0)`
repo_url_dir="$1"
destination_dir="$2"
for repo_url_file in `list_repo_url $repo_url_dir`
do
	for url in `cat $repo_url_file`
	do
		dir=`split $url "/" 4`		#echo $url|cut -d \/ -f 5`
		echo $dir
	done
done
exit 0
