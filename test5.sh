#!/bin/bash
a=${1:-~}
#a=${a:=~}
echo $a
cd $a 2>/dev/null
pwd
if [ -d ~ ]
then
	echo ~:exit
fi
