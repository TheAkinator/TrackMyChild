source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '12.1'

target 'TrackMyChild' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TrackMyChild
  pod 'Firebase/Database'
  pod 'SwiftLint'
  
  target 'TrackMyChildTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TrackMyChildUITests' do
    # Pods for testing
  end

end

post_install do |pi|
  pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.1'
      end
  end
end
