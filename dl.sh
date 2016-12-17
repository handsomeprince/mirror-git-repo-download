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
			echo -e "\033[31merror:\t`pwd`\tmaybe is not a normal git bare repository\033[0m"
			echo -e "\033[31merror:\t`pwd`\tmaybe is not a normal git bare repository\033[0m" > ../sync.log
		else
			git repack -a -b -d
		fi
		cd ..
	fi
done
exit 0
