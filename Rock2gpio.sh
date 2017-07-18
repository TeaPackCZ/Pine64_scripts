#!/bin/bash

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

