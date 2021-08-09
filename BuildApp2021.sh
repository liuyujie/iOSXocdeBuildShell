#!/bin/bash
export LANG=en_US.UTF-8
#参考自 https://github.com/qindeli/WorksapceShell
#注意：脚本和WorkSpace必须在同一个目录
#工程名字(Target名字) 2021-04-30 21:10:48
Project_Name="Project_Name"
IPA_Name="IPA_Name"

#workspace的名字
Workspace_Name="Workspace_Name"
#配置环境，Release或者Debug,默认release
Configuration="Release"
#IPA存放的地址
IPA_Save_Path="/Users/${USER}/Desktop/${Project_Name}"_$(date +%m%d_%H%M%S)

#导出IPA需要的配置文件plist
PlistPath=./AppAdHoc.plist
PlistPath=${PlistPath}

if [ -n "$1" ]; then
    echo "更新了：$1"
else
    echo "请输入更新日志"
    exit;
fi

# 打包
xcodebuild -workspace $Workspace_Name.xcworkspace -scheme $Project_Name -configuration $Configuration -archivePath build/$Project_Name-build.xcarchive clean archive
# 导出IPA
xcodebuild -exportArchive -archivePath build/$Project_Name-build.xcarchive -exportOptionsPlist ${PlistPath} -exportPath $IPA_Save_Path -allowProvisioningUpdates YES

# 获取更新日志
# git log -2 --pretty=format:"%H %s" > build/log.log

# 复制 dSYMs 文件
cp -R build/$Project_Name-build.xcarchive/dSYMs $IPA_Save_Path
# 上传到fir.im
fir publish ${IPA_Save_Path}/${IPA_Name}.ipa -c $1 --skip_update_icon

# 删除build目录
rm -rf build

# # 更新说明
# UPDATE_DES="V1.2.0:测试环境安装包 修复BUG"

# # 上传蒲公英pgyer
# PGY_APIKEY="bKEY1b4d3216fd2db6cf5d2key89"
# curl --insecure -F "file=@${IPA_Save_Path}/${Project_Name}.ipa" -F "_api_key=${PGY_APIKEY}" -F "buildInstallType=2" -F "buildPassword=13456" -F "buildUpdateDescription=${UPDATE_DES}" https://www.pgyer.com/apiv2/app/upload
