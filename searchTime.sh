#!/bin/sh

while true
do
	echo 'ANIを入力してください'
	read ani
	echo 'ファイル名を入力してください(trace.logならそのままEnter)'
	read pass
	# なにも入力せずEnterだったらtrace.logを入れる
	if [ -z ${pass} ]; then
		pass="trace.log"
	fi
	# aniを含めた1行を抽出
	aniLine=$(grep $ani "./$pass")
	echo $aniLine
	# sidを抽出
	sid=`echo $aniLine | cut -c 32-64`
	echo $sid
	# sidから1家電のlogを抽出
	oneTellLog=$(grep $sid "./$pass")
	# もしかしたら別のも引っ掛けるかもしれない。最後に改行を含めたいが書き方がわからない
	beginTimeLine=$(grep "servlet : Srv_C00001" "./$pass")
	echo $beginTimeLine
	# 始まりの時間
	beginTimeString=`echo $beginTimeLine | cut -c 12-24`
	echo $beginTimeString
	# C01の開始行
	beginTimeLineNum=`echo $(grep -n "$beginTimeLine" "./$pass") | cut -d ':' -f1`
	echo $beginTimeLineNum
done
