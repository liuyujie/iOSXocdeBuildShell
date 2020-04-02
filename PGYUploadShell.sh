#!/bin/bash
IPA_NAME="AppName"

Current_Base_Path=$(cd `dirname $0`; pwd)
echo ${Current_Base_Path}

# PGY_UKEY="PGY_ukey"
# PGY_APIKEY="PGY_api_key"

# curl -F "file=@${Current_Base_Path}/${IPA_NAME}.ipa" -F "uKey=${PGY_UKEY}" -F "_api_key=${PGY_APIKEY}" https://qiniu-storage.pgyer.com/apiv1/app/upload


# PGY_APIKEY="bf6ad80a3321b4d3216fd2db6cf5d289"
#上传蒲公英pgyer
# curl --insecure -F "file=@${IPA_Save_Path}/${Project_Name}.ipa" -F "_api_key=${PGY_APIKEY}" -F "buildInstallType=2" -F "buildPassword=13456" -F "buildUpdateDescription=TestAPI" https://www.pgyer.com/apiv2/app/upload
