
Pod::Spec.new do |s|
s.name         = "XYFSnowAnimation"
s.version      = "1.0.0"
s.summary      = "A category of NSTimer for showing snow animaton,which is used very simply."
s.homepage     = "https://github.com/CoderXYF/XYFSnowAnimation"
s.license      = "MIT"
s.author             = { "CoderXYF" => "2016003298@qq.com" }
s.platform     = :ios, "7.0"
s.source       = { :git => "https://github.com/CoderXYF/XYFSnowAnimation.git", :tag => "1.0.0" }
s.source_files  = "XYFSnowAnimation/*.{h,m}"
s.frameworks = "UIKit", "Foundation"
s.requires_arc = true
s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end
