#
#  Be sure to run `pod spec lint SRHelper.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '10.0'
s.name = 'SRHelper'
s.summary = 'SRHelper provides necessary helper extensions for UI components.'
s.requires_arc = true

s.version = '0.1.0'

s.license = { :type => 'MIT', :text => <<-License

Copyright (c) [2018] [Sajeev Raj]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
License
}

s.author = { 'Sajeev Raj' => 'sajeevraj.1989@gmail.com' }

s.homepage = 'https://github.com/SajeevRaj5/SRHelper.git'

s.source = { :git => 'https://github.com/SajeevRaj5/SRHelper.git', 
             :tag => s.version.to_s }

s.source_files = 'SRHelper/SRHelper/Classes/**/*'

s.swift_version = '4.1'

end
