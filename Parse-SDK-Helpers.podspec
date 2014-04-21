Pod::Spec.new do |s|

  s.name         = "Parse-SDK-Helpers"
  s.version      = "1.1.0"
  s.summary      = "Parse iOS and OSX SDK helpers."
  s.homepage     = "https://parse.com"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Maxim Khatskevich" => "maxim.khatskevich@gmail.com" }

  s.ios.deployment_target = "5.0" # Parse-iOS-SDK minimal supported iOS version
  s.osx.deployment_target = "10.8" # Parse-OSX-SDK minimal supported OS X version

  s.source       = { :git => "https://github.com/maximkhatskevich/ParseHelpers.git", :tag => "#{s.version}" }
  
  s.framework = "Foundation"
  s.ios.dependency "Parse-iOS-SDK", "~> 1.2.19"
  s.osx.dependency "Parse-OSX-SDK", "~> 1.2.18"
  s.requires_arc = true

  s.subspec 'Core' do |cs|
    cs.source_files  = "Main/Src/Core", "Main/Src/*.h"
  end

  s.subspec 'UserExt' do |us|
    us.source_files  = "Main/Src/User"
  end

  s.default_subspec = 'Parse-SDK-Helpers/Generic'

end
