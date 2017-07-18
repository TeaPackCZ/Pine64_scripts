#!/bin/bash

mREST=${1##P}

PAD_NAME=(${mREST//[0-9]/ })
PAD_NUM=(${mREST//[A-Z]/ })

PAD_SUB=$(printf '%d\n' "'$PAD_NAME")

GPIO_ID=$((((PAD_SUB - 65)*(32))+(PAD_NUM)))

#echo "PadName: <$PAD_NAME/$PAD_SUB> PadNum: <$PAD_NUM>"
#echo "GPIO ID <$GPIO_ID>"

echo $GPIO_ID
exit 0

