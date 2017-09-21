#!/bin/bash
#参考自 https://github.com/qindeli/WorksapceShell
#注意：脚本和WorkSpace必须在同一个目录
#工程名字(Target名字)
Project_Name="Project_Name"
#workspace的名字
Workspace_Name="Workspace_Name"
#配置环境，Release或者Debug,默认Release
Configuration="Release"
#IPA存放的地址
IPA_Save_Path="/Users/${USER}/Desktop/${Project_Name}"_$(date +%H%M%S)

EnterpriseExportOptionsPlist=./EnterprisePlistDev.plist
EnterpriseExportOptionsPlist=${EnterpriseExportOptionsPlist}

#clean
xcodebuild clean -configuration $Configuration -alltargets

#打包archive
xcodebuild archive -workspace $Workspace_Name.xcworkspace -scheme $Project_Name -configuration $Configuration -archivePath build/$Project_Name-build.xcarchive 

#导出IPA
xcodebuild -exportArchive -archivePath build/$Project_Name-build.xcarchive -exportOptionsPlist "${EnterpriseExportOptionsPlist}" -exportPath $IPA_Save_Path


#上传fir.im （需要安装fir cli [https://github.com/FIRHQ/fir-cli/blob/master/README.md]）
fir publish ${IPA_Save_Path}/${Project_Name}.ipa

rm -rf build