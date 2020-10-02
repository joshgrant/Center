platform :ios, '14.0'

inhibit_all_warnings!

target 'Center' do
  use_frameworks!
  pod 'Kingfisher'
  pod 'ReSwift'
  pod 'PromiseKit'
  pod 'SwiftyJSON'
  pod 'Timepiece'

  target 'CenterTests' do
    inherit! :search_paths
  end

  target 'CenterUITests' do
  end
end

target 'Core' do
    use_frameworks!
    pod 'RealmSwift'

    target 'CoreTests' do
    end
end
