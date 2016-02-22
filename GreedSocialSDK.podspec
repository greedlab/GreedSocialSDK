Pod::Spec.new do |s|

  s.name         = "GreedSocialSDK"
  s.version      = "0.1.5"
  s.summary      = "社交化SDK集成"
  s.description  = %{社交化SDK集成，包括QQ、微信、微博}
  s.homepage     = "https://github.com/greedlab/GreedSocialSDK"
  s.license      = "MIT"
  s.author       = { "Bell" => "bell@greedlab.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/greedlab/GreedSocialSDK.git", :tag => s.version }
  s.source_files  = "GreedSocialSDK", "GreedSocialSDK/*.{h,m}"
  s.framework  = "Foundation","UIKIT"
  s.requires_arc = true
  s.dependency "GreedTencentOpenAPI"
  s.dependency "GreedWeChatSDK"
  s.dependency "WeiboSDK"
  s.dependency "GreedCategory"

end