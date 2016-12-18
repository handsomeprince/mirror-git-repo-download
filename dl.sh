#!/bin/bash
#Copyright (c) 2016 Prince King <wyhddzxx2@gmail.com>
#This file is under MIT license

#requires: git

#set -e
#set -o pipefail
for url in `cat repo_url/gnome_repo_url.txt`
do
	dir=`echo $url|cut -d \/ -f 5`
	if [ ! -d $dir.git ]
	then
		echo -e "\033[32mCLONE $dir.git\033[0m"
		echo -e "\033[32m------------------------------------------------\033[0m"
		git clone --mirror $url
	else
		echo -e "\033[32mUPDATE $dir.git\033[0m"
		echo -e "\033[32m------------------------------------------------\033[0m"
		cd $dir.git
		git remote -v update 2>/dev/null
		if [ $? != 0 ]
		then
#			echo -e "\033[31merror:\t`pwd`\tmaybe is not a normal git bare repository\033[0m"
			echo -e "\033[31merror:\t`pwd`\tmaybe is not a normal git bare repository\033[0m" >&1 |tee -a ../sync_err.log
		else
			countObject=`ls ./objects/pack|wc -l`
			if (($countObject > 3))
			then
				git repack -a -b -d
			fi
		fi
		cd ..
	fi
	echo -e "\033[32mDONE\033[0m"
done
exit 0
