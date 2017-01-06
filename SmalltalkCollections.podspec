#
# Be sure to run `pod lib lint SmalltalkCollections.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SmalltalkCollections'
  s.version          = '0.1.0'
s.summary          = 'Categories that provide Smalltalk collections operations like collect: detect: do: etc...'


  s.description      = <<-DESC
Loosely based on an older library by Michael Dippery <michael@monkey-robot.com>
The primary thing holding back Objective C's standard collections was the absence of blocks.
While the new block syntax is indeed horrific (see http://fuckingblocksyntax.com) the introduction
of blocks allows for a much more functional style of programming previously enjoyed in Smalltalk
(ObjectiveC's inspiration language).
                       DESC

  s.homepage         = 'https://github.com/tblanchard/SmalltalkCollections4ObjC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tblanchard' => 'tblanchard@mac.com' }
  s.source           = { :git => 'https://github.com/tblanchard/SmalltalkCollections.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SmalltalkCollections/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SmalltalkCollections' => ['SmalltalkCollections/Assets/*.png']
  # }

  s.public_header_files = 'SmalltalkCollections/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
