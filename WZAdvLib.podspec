#
# Be sure to run `pod lib lint WZAdvLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WZAdvLib'
  s.version          = '1.1.4'
  s.summary          = 'WZAdvLib for wz'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Joe-China/WZAdvLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joe-China' => '363755168@qq.com' }
  s.source           = { :git => 'https://github.com/Joe-China/WZAdvLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WZAdvLib/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WZAdvLib' => ['WZAdvLib/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
   s.dependency 'Masonry'
    s.dependency 'SDCycleScrollView'
     s.dependency 'XHLaunchAd','~>3.9.12'
      s.dependency 'JSONModel'
       s.dependency 'MJExtension'
end
