#!/bin/bash
#set -e
#set -o pipefail
for line in `cat gnome_repo_url.txt`
do
	dir=`echo $line|cut -d \/ -f 5`
	if [ ! -d $dir.git ]
	then
		git clone --mirror $line
	else
		cd $dir.git
		git remote -v update
		if [ $? != 0 ]
		then
			cd ..
			rm -rf $dir.git
			git clone --mirror $line
		else
			git repack -a -b -d
			cd ..
		fi
	fi
done
exit 0
