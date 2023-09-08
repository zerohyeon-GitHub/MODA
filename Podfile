platform :ios, '15.0'

target 'MODA' do
  use_frameworks!
  pod 'Alamofire', '~> 5.8.0'
  pod 'SwiftyJSON', '~> 5.0.1'
  pod 'Kingfisher', '~> 6.0'
  pod 'SnapKit'
  pod 'GoogleAPIClientForREST'
  pod 'GoogleSignIn'
  pod 'YouTubePlayer'
  pod 'YoutubePlayer-in-WKWebView'

end
post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
end