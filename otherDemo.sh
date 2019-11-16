export LANG="en_US.UTF-8"


####################参数、环境变量定义#########################
#工程项目路径
projectPath="$(pwd)"
#工程项目名称
projectName="xxxx"
#工程项目打包模式
buildConfiguration="Release"
#IPA配置文件
exportOptionsPlist="${projectPath}/Package/${Archive}.plist"

#证书
ADHOCCODE_SIGN_IDENTITY="iPhone Distribution: xxxx"
DEVELOPMENT_TEAM="跟在iPhone Distribution:xxxx后面括号里面的值"
#描述文件
Main_Provisioning_Profile="xxxx-xxxx-xxxx-xxxx-xxxxx"
Extension_Provisioning_Profile="xxxx-xxxx-xxxx-xxxx-xxxxx"

#build文件路径
buildPath="${projectPath}/build"
#发布文件路径
releasePath="${projectPath}/build/Release-iphoneos"
#archive保存路径
archivePath="${projectPath}/archive"
archiveName="${projectName}.xcarchive"
archiveFilePath="${archivePath}/${archiveName}"

#ipa保存路径
ipaPath="${projectPath}/ipa"
#log日志路径
logfilePath="${projectPath}/ChangeLog"



#先删除存在的文件目录
rm -rdf "$buildPath"
rm -rdf "$archivePath"
rm -rdf "$ipaPath"
rm -rdf "${logfilePath}"
#再创建新的文件目录
mkdir "$buildPath"
mkdir "$releasePath"
mkdir "$archivePath"
mkdir "$ipaPath"
touch "${logfilePath}"

echo "***********************参数、环境变量***********************"
echo "当前目录路径-------->${projectPath}"
echo '打包模式：'$buildConfiguration
echo '工程目录：'$projectPath
echo '工程名称：'$projectName
echo '安装包路径 '$archiveFilePath 
echo '\n'

echo "***********************开始build archive app文件***********************"


#打包的命令
xcodebuild -workspace "${projectPath}/${projectName}.xcworkspace" -scheme "$projectName" -configuration ${buildConfiguration} -archivePath "${archiveFilePath}" CONFIGURATION_BUILD_DIR="${releasePath}" DEVELOPMENT_TEAM="${DEVELOPMENT_TEAM}" CODE_SIGN_IDENTITY="${ADHOCCODE_SIGN_IDENTITY}" APP_PROFILE="${Main_Provisioning_Profile}" EXTENSION_PROFILE="${Extension_Provisioning_Profile}" clean archive


EXCODE=$?
if [ "$EXCODE" == "0" ]; then
echo "O.K"
else
echo "***********************编译失败********************************"
exit 1
fi

#导出ipa文件
xcodebuild -exportArchive -archivePath ${archiveFilePath} -exportPath ${ipaPath} -exportOptionsPlist $exportOptionsPlist

echo "***********************结束build archive app文件***********************"

echo "***********************设置包名称信息***********************"
#app文件存放位置和命名
appPath="${archiveFilePath}/Products/Applications"
appFile="${appPath}/${projectName}.app"
#app文件中Info.plist文件路径
appInfoPlistPath=$appFile/Info.plist
#取版本号
version=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" ${appInfoPlistPath})
#取Build号
buildNo=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" ${appInfoPlistPath})
#取bundle id
bundleId=$(/usr/libexec/PlistBuddy -c "print CFBundleIdentifier" ${appInfoPlistPath})
#取应用名称
appName=$(/usr/libexec/PlistBuddy -c "print CFBundleDisplayName" ${appInfoPlistPath})
#包编译类型(ad-hoc,enterprise...)
buildMethod=$(/usr/libexec/PlistBuddy -c "print method" ${exportOptionsPlist})
#打包的时间
date=$(date +%Y%m%d%H%M)
#判断放ipa包的目录是否存在
destinationPath="{这里填上你最后想保存的路径目录}/${buildMethod}/${projectName}/${version}"
if [ ! -d "$destinationPath" ]; then
    mkdir -p "$destinationPath"
fi
ipaFile="${projectName}_${buildMethod}_${version}(${date}).ipa"
dSYMFile="${projectName}_${buildMethod}_${version}(${date}).app.dSYM"
ipaFilePath="${destinationPath}/${ipaFile}"
dSYMFilePath="${destinationPath}/${dSYMFile}"

#将ipa跟dSYM移动到指定目录下
mv -f "${releasePath}/${projectName}.ipa" $ipaFilePath
mv -f "${releasePath}/${projectName}.app.dSYM" $dSYMFilePath
echo "** 安装包最终存放路径--->${ipaFilePath} **"

echo "*************************开始上传到fir**************************"

fir login "fir 登录的 token"

fir me


if [ ! -f "$logfileDir" ]; then
fir publish ${ipaFilePath} -c "无更新记录"
else
fir publish ${ipaFilePath} -c ${logfileDir}
fi
echo "*************************结束上传到fir**************************"

echo "*************************开始上传到蒲公英**************************"

curl -F "file=${ipaFilePath}" \
 -F "updateDescription=${logfileDir}" \
-F "uKey=蒲公英账户中心 userkey" \
-F "_api_key=蒲公英账户中心 apikey" \
https://www.pgyer.com/apiv1/app/upload
echo "*************************结束上传到蒲公英**************************"
#移除日志文件
rm -rdf "${logfileDir}"
exit

