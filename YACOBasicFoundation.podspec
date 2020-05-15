#
# Be sure to run `pod lib lint YACOBasicFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YACOBasicFoundation'
  s.version          = '0.1.4'
  s.summary          = 'YACOBasicFoundation.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'YACOBasicFoundation'

  s.homepage         = 'https://github.com/LYFGH/YACOBasicFoundation.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LYFGH' => 'yafei_v5@163.com' }
  s.source           = { :git => 'https://github.com/LYFGH/YACOBasicFoundation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  
  s.frameworks = 'UIKit', 'Foundation'
  
  s.source_files = 'YACOBasicFoundation/Classes/**/*'
  s.static_framework = true
  
#  s.subspec 'NSArray' do |nSArray|
#    nSArray.source_files = 'YACOBasicFoundation/Classes/NSArray/**/*.{h,m}'
#    nSArray.public_header_files = 'YACOBasicFoundation/Classes/NSArray/**/*.h'
#  end
#
#
#  s.subspec 'NSData' do |nSData|
#    nSData.source_files = 'YACOBasicFoundation/Classes/NSData/**/*.{h,m}'
#    nSData.public_header_files = 'YACOBasicFoundation/Classes/NSData/**/*.h'
#  end
#
#  s.subspec 'NSDate' do |nSDate|
#    nSDate.source_files = 'YACOBasicFoundation/Classes/NSDate/**/*.{h,m}'
#    nSDate.public_header_files = 'YACOBasicFoundation/Classes/NSDate/**/*.h'
#  end
#
#  s.subspec 'NSDictionary' do |nSDictionary|
#    nSDictionary.source_files = 'YACOBasicFoundation/Classes/NSDictionary/**/*.{h,m}'
#    nSDictionary.public_header_files = 'YACOBasicFoundation/Classes/NSDictionary/**/*.h'
#  end
#
#  s.subspec 'NSNotificationCenter' do |nSNotificationCenter|
#    nSNotificationCenter.source_files = 'YACOBasicFoundation/Classes/NSNotificationCenter/**/*.{h,m}'
#    nSNotificationCenter.public_header_files = 'YACOBasicFoundation/Classes/NSNotificationCenter/**/*.h'
#  end
#
#  s.subspec 'NSString' do |nSString|
#    nSString.source_files = 'YACOBasicFoundation/Classes/NSString/**/*.{h,m}'
#    nSString.public_header_files = 'YACOBasicFoundation/Classes/NSString/**/*.h'
#  end
#
#  s.subspec 'NSTimer' do |nSTimer|
#    nSTimer.source_files = 'YACOBasicFoundation/Classes/NSTimer/**/*.{h,m}'
#    nSTimer.public_header_files = 'YACOBasicFoundation/Classes/NSTimer/**/*.h'
#  end
  
  
  # s.resource_bundles = {
  #   'YACOBasicFoundation' => ['YACOBasicFoundation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
