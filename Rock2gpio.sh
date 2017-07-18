#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Usage:"
	echo "$0 GPIO3_A7"
	echo ""
	echo "GPIO3_A7 is standard pin name found in:"
	echo "http://files.pine64.org/doc/rock64/ROCK64_Pi-2%20_and_Pi_P5+_Bus.pdf"
	exit 1
fi

mREST=${1##GPIO}

REST_ARR=(${mREST//_/ })
BANK_NUM=${REST_ARR[0]}
PAD_NAME=(${REST_ARR[1]//[0-9]/ })
PAD_NUM=(${REST_ARR[1]//[A-Z]/ })

PAD_SUB=$(printf "%d\n" "'$PAD_NAME")

GPIO_ID=$(((BANK_NUM * 32)+(((PAD_SUB - 65)*(8)) + PAD_NUM)))

#echo "BANK: <$BANK_NUM>, PadName: <$PAD_NAME/$PAD_SUB> PadNum: <$PAD_NUM>"
#echo "GPIO ID <$GPIO_ID>"

echo $GPIO_ID
exit 0

