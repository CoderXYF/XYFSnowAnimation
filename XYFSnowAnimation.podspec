Pod::Spec.new do |s|
s.name         = "XYFSnowAnimation"
s.version      = "1.1.1"
s.summary      = "A category of NSTimer for showing snow animaton,which is used very simply."
s.description  = "A category of NSTimer for showing snow animaton,which is used very simply.Welcome to use!"
s.homepage     = "https://github.com/CoderXYF/XYFSnowAnimation"


s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "CoderXYF" => "https://github.com/CoderXYF" }

s.platform = :ios, "7.0"

s.source = { :git => "https://github.com/CoderXYF/XYFSnowAnimation.git", :tag => "1.1.1" }

s.source_files  = "XYFSnowAnimationDemo/XYFSnowAnimation/*.{h,m}"

s.requires_arc = true

end
