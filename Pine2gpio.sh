#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Usage:"
	echo "$0 PL7"
	echo ""
	echo "PL7 is standard pin name and can be found at:"
	echo "http://files.pine64.org/doc/Pine%20A64%20Schematic/Pine%20A64%20Pin%20Assignment%20160119.pdf"
	exit 0
fi

mREST=${1##P}

PAD_NAME=(${mREST//[0-9]/ })
PAD_NUM=(${mREST//[A-Z]/ })

PAD_SUB=$(printf '%d\n' "'$PAD_NAME")

GPIO_ID=$((((PAD_SUB - 65)*(32))+(PAD_NUM)))

#echo "PadName: <$PAD_NAME/$PAD_SUB> PadNum: <$PAD_NUM>"
#echo "GPIO ID <$GPIO_ID>"

echo $GPIO_ID
exit 0

