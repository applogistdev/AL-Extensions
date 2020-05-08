#
# Be sure to run `pod lib lint AlExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AlExtensions'
  s.version          = '0.3.0'
  s.summary          = 'Useful extensions for Swift.'
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  TODO: Add long description of the pod here.
  DESC

  s.homepage         = 'https://github.com/applogistdev/AL-Extensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors           = { 'sonifex' => 'sonerguler93@gmail.com', 'ahmetsina' => 'asend.ustem@gmail.com' }
  s.source           = { :git => 'https://github.com/applogistdev/AL-Extensions.git', :tag => s.version.to_s}
  s.swift_version = '5'
  s.ios.deployment_target = '9.3'
  s.source_files = 'Sources/AlExtensions/Classes/**/*'
  s.frameworks = 'UIKit'
end
