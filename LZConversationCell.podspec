Pod::Spec.new do |s|
  s.name         = "LZConversationCell"
  s.version      = "0.0.1"
  s.summary      = "LZConversationCell use to display lastest message in IM App"
  s.description  = "LZConversationcell use in lastest converstaion controller in IM App"
  s.homepage     = "https://github.com/lzwjava/LZConversationCell"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "lzwjava" => "lzwjava@gmail.com" }
  s.social_media_url   = "http://weibo.com/zhiweilee"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/lzwjava/LZConversationCell.git", :tag => "0.0.1" }
	s.source_files  = "LZConversationCell/Classes/**/*.{h,m}"
  s.dependency "JSBadgeView", "~> 1.4"

end
