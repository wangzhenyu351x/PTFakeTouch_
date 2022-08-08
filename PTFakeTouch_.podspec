#
# Be sure to run `pod lib lint PTFakeTouch_.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PTFakeTouch_'
  s.version          = '0.1.2'
  s.summary          = '模拟iOS 屏幕点击操作'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  PTFakeTouch_
编译修改自：[PugaTang/PTFakeTouch](https://github.com/PugaTang/PTFakeTouch)
模拟iOS 屏幕点击操作
                       DESC

  s.homepage         = 'https://github.com/wangzhenyu351x/PTFakeTouch_'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangzhenyu' => '762540061@qq.com' }
  s.source           = { :git => 'https://github.com/wangzhenyu351x/PTFakeTouch_.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PTFakeTouch_/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PTFakeTouch_' => ['PTFakeTouch_/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'IOKit' #, 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
