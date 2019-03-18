#
# Be sure to run `pod lib lint TProjectKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TProjectKit'
  s.version          = '0.0.2'
  s.summary          = 'Some handy components,Its all personal preference.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/AsTao/TProjectKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SsTaoz' => '236048180@qq.com' }
  s.source           = { :git => 'https://github.com/AsTao/TProjectKit.git', :tag => s.version.to_s }


  s.ios.deployment_target = '9.0'
  s.resources = 'TProjectKit/Assets/SwiftResource.bundle'
  s.source_files = 'TProjectKit/Common/*','TProjectKit/Extentions/*','TProjectKit/Base/*'
 
  s.frameworks = 'UIKit', 'Foundation' , 'CoreGraphics'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
  s.swift_version = '4.2'

end
