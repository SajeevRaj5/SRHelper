#
#  Be sure to run `pod spec lint SRHelper.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "SRHelper"
s.summary = "SRHelper provides necessary helper extensions for UI components."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Sajeev Raj" => "sajeevraj.1989@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/SajeevRaj5/SRHelper.git"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/SajeevRaj5/SRHelper.git", 
             :tag => "#{s.version}" }

# 7
s.source_files = "SRHelper/**/*.{swift}"

# 8
s.resources = "SRHelper/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 9
s.swift_version = "4.1"

end
