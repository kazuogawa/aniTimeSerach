#!/bin/sh

while true
do
	echo 'ANIを入力してください'
	read ani
	echo 'ファイル名を入力してください(trace.logならそのままEnter)'
	read pass
	if [ -z ${pass} ]; then
		pass="trace.log"
	fi
	aniLine=$(grep $ani "./$pass")
	echo $aniLine
	sid=`echo $aniLine | cut -c 32-64`
	echo $sid
done
