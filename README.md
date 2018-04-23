# iOSXocdeBuildShell

此为Shell脚本用**企业证书**打包iOS APP的源码 特简单

XcodeNoWorkSpace.sh 

	此为xcode简单项目没有pod的项目。

XcodeWorkSpace.sh

	此为xcodeworkspace项目有pod的项目。

此脚本参考自： 
	
	https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/xcodebuild.1.html
	https://github.com/qindeli/WorksapceShell 
	https://github.com/hades0918/ipapy

蒲公英自动上传Python脚本地址：

	https://github.com/caiwenshu/CI_pgy/blob/master/pgy_upload_temp.py
	
Jenkins+ Xcode+ 蒲公英 实现IOS自动化打包和分发

	http://www.jianshu.com/p/371595ef08fe
	
	

EnterprisePlist 参数说明：

	method: (String) 可填写项如下:
		development
		app-store
		enterprise
		ad-hoc
	
	teamID: (String) The development program team identifier.
	
	uploadSymbols: (Boolean) Option to include symbols in the generated ipa file.
	
	uploadBitcode: (Boolean) Option to include Bitcode.


调用**Application Loader**上传 IPA 到 APPStore


	# 验证并上传到App Store
	# 将 -u 后面的XXX替换成自己的AppleID的账号，-p 后面的XXX替换成自己的密码
	
	altoolPath="/Applications/Xcode.app/Contents/Applications/Application Loader.app/Contents/Frameworks/ITunesSoftwareService.framework/Versions/A/Support/altool"
	
	"$altoolPath" --validate-app -f ${exportIpaPath}/${scheme_name}.ipa -u XXX -p XXX -t ios --output-format xml
	
	"$altoolPath" --upload-app -f ${exportIpaPath}/${scheme_name}.ipa -u  XXX -p XXX -t ios --output-format xml
