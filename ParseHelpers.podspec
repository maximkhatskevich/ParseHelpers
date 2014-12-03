Pod::Spec.new do |s|

  s.name         = "ParseHelpers"
  s.version      = "1.2.0"
  s.summary      = "Parse iOS and OSX SDK helpers."
  s.homepage     = "https://parse.com"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Maxim Khatskevich" => "maxim.khatskevich@gmail.com" }

  s.ios.deployment_target = "6.0" # Parse-iOS-SDK minimal supported iOS version
  s.osx.deployment_target = "10.8" # Parse-OSX-SDK minimal supported OS X version

  s.source       = { :git => "https://github.com/maximkhatskevich/ParseHelpers.git", :tag => "#{s.version}" }
  
  s.framework = "Foundation"
  s.ios.dependency "Parse", "~> 1.5"
  s.osx.dependency "Parse", "~> 1.5"
  s.requires_arc = true

  s.default_subspec = 'Core'

  s.subspec 'Core' do |cs|
    cs.source_files  = "Main/Src/*.h", "Main/Src/Core/*.{h,m}"
  end

  s.subspec 'UserExt' do |us|
    us.source_files  = "Main/Src/ParseMacros.h", "Main/Src/Core/PFUser+ParseHelpers.{h,m}", "Main/Src/UserExt/*.{h,m}"
  end

end
