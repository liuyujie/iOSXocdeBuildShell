#!/bin/bash
IPA_NAME="AppName"

Current_Base_Path=$(cd `dirname $0`; pwd)
echo ${Current_Base_Path}

PGY_UKEY="PGY_ukey"
PGY_APIKEY="PGY_api_key"

curl -F "file=@${Current_Base_Path}/${IPA_NAME}.ipa" -F "uKey=${PGY_UKEY}" -F "_api_key=${PGY_APIKEY}" https://qiniu-storage.pgyer.com/apiv1/app/upload
