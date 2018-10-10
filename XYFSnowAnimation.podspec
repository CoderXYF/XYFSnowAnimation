Pod::Spec.new do |s|

s.name         = "XYFSnowAnimation"

s.version      = "2.0.1"

s.ios.deployment_target = '8.0'

s.summary      = "A category of NSTimer for showing 3D Fluttered animation, which is used very simply."

s.homepage     = "https://github.com/CoderXYF/XYFSnowAnimation"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "CoderXYF" => "https://github.com/CoderXYF" }

s.source = { :git => "https://github.com/CoderXYF/XYFSnowAnimation.git", :tag => "2.0.1" }

s.source_files  = "XYFSnowAnimationDemo/XYFSnowAnimation/*.{h,m}"

s.requires_arc = true

end
