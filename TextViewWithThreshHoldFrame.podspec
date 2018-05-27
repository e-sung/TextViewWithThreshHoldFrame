#
# Be sure to run `pod lib lint TextViewWithThreshHoldFrame.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TextViewWithThreshHoldFrame'
  s.version          = '0.0.2'
  s.summary          = 'TextView that grows until certain ThreshHold'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'UITextView is great because it grows its size dynamically binded with its content text. But sometimes, you don\'t want it to grow more than certain size. This pod exactly give you that option. '

  s.homepage         = 'https://github.com/e-sung/TextViewWithThreshHoldFrame'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'e-sung' => 'dev.esung@gmail.com' }
  s.source           = { :git => 'https://github.com/e-sung/TextViewWithThreshHoldFrame.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'TextViewWithThreshHoldFrame/Classes/**/*'
  s.swift_version = '4.1'
  
  # s.resource_bundles = {
  #   'TextViewWithThreshHoldFrame' => ['TextViewWithThreshHoldFrame/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
