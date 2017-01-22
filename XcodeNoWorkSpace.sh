#!/bin/sh -vx
#参考自 https://github.com/qindeli/WorksapceShell
#注意：脚本和xcodeproj必须在同一个目录
#工程名字(Target名字)
Project_Name="Project_Name"
#xcodeproj的名字
Xcodeproj_Name="Xcodeproj_Name"
#Bundle ID
AppBundleID="*.*.*"
#配置环境，Release或者Debug,默认release
Configuration="Release"
#IPA存放的地址
IPA_Save_Path='~/Desktop/'${Project_Name}_$(date +%H%M%S).ipa

EnterpriseExportOptionsPlist=./EnterprisePlist.plist
EnterpriseExportOptionsPlist=${EnterpriseExportOptionsPlist}

# 证书名 和 描述文件
CODE_SIGN_IDENTITY="iPhone Distribution: *"
# mobileprovision存放的地址（自定义）
PROVISIONING_PROFILE_NAME="/Users/mobileprovision/*.mobileprovision"

# 打包并导出IPA
xcodebuild -project $Xcodeproj_Name.xcodeproj -scheme $Project_Name -configuration $Configuration -archivePath build/$Project_Name-build.xcarchive archive build CODE_SIGN_IDENTITY="${CODE_SIGN_IDENTITY}" PROVISIONING_PROFILE="${PROVISIONING_PROFILE_NAME}" PRODUCT_BUNDLE_IDENTIFIER="${AppBundleID}"
xcodebuild -exportArchive -archivePath build/$Project_Name-build.xcarchive -exportOptionsPlist ${EnterpriseExportOptionsPlist} -exportPath $IPA_Save_Path
