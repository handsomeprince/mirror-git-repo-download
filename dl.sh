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
		git remote -v update 2>/dev/null
		if [ $? != 0 ]
		then
			echo -e "\033[31merror:\t`pwd`\tmaybe is not a normal git bare repository\033[0m"
			echo -e "\033[31merror:\t`pwd`\tmaybe is not a normal git bare repository\033[0m" > ../sync.log
		else
			countObject=`ls ./objects/pack|wc -l`
			if (($countObject > 3))
			then
				git repack -a -b -d
			fi
		fi
		cd ..
	fi
done
exit 0
