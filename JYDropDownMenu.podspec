#
# Be sure to run `pod lib lint JYDropDownMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JYDropDownMenu"
  s.version          = "1.0.0"
  s.summary          = "A drop-down menu list as an alternative to UIPickerView"
  s.description      = <<-DESC
                       JYDropDownMenu is a drop-down menu written in Swift. The title is a UIView with an embedded UILabel
                       that contains the title of the menu, and clicking on the title will drop the menu down, from
                       which you can select the item of your choice.
                       DESC

  s.homepage         = "https://github.com/Jerry-J-Yu/JYDropDownMenu"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jerry Yu" => "jerryyu@uchicago.edu" }
  s.source           = { :git => "https://github.com/Jerry-J-Yu/JYDropDownMenu.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Source/*.swift'
end