Pod::Spec.new do |s|

  s.name         = "ParseHelpers"
  s.version      = "1.2.2"
  s.summary      = "Parse iOS and OSX SDK helpers."
  s.homepage     = "https://parse.com"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Maxim Khatskevich" => "maxim.khatskevich@gmail.com" }

  s.ios.deployment_target = "7.0" # Parse-iOS-SDK minimal supported iOS version
  s.osx.deployment_target = "10.8" # Parse-OSX-SDK minimal supported OS X version

  s.source       = { :git => "https://github.com/maximkhatskevich/ParseHelpers.git", :tag => "#{s.version}" }
  
  s.framework = "Foundation"
  s.dependency 'Parse', '~> 1.6'
  s.dependency 'MKHGenericHelpers'
  s.requires_arc = true

  s.default_subspec = "Core"

  s.subspec "Core" do |cs|
    cs.source_files  = "Src/*.h", "Src/Core/*.{h,m}"
  end

  s.subspec "UserExt" do |us|
    us.source_files  = "Src/ParseMacros.h", "Src/Core/PFUser+ParseHelpers.{h,m}", "Src/UserExt/*.{h,m}"
  end

  s.subspec "KVO" do |kvos|
    kvos.dependency 'KVOController', '~> 1.0'
    kvos.source_files  = "Src/KVO/*.{h,m}"
  end

end
