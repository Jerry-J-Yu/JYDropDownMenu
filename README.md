# JYDropDownMenu
A drop-down menu list as an alternative to UIPickerView

## Installation:

### Method 1 (CocoaPods only for iOS 8.0 and above)
**JYDropDownMenu** is available through [CocoaPods](http://cocoapods.org). To install it, add the following lines to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'JYDropDownMenu', '~> 1.0.0'
```

### Method 2 (Source files)
Alternatively, you can add all source files in the "Source" folder to your project

## Usage

### Programmatically
Start by creating an array that contains strings as the elements of the JYDropDownMenu
```swift
let items: [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
```
Create a **new instance** of JYDropDownMenu
```swift
let dropDownMenu = JYDropDownMenu(frame: CGRect(x: 50, y: 50, width: 260, height: 40), title: "Choose An Item", items: items)
```
Implement the delegate
```swift
self.dropDownMenu.delegate = self
```
Add the JYDropDownMenu as a `subview`.
```swift
self.view.addSubview(self.dropDownMenu)
```
Use delegate method to determine which item in the array was selected
```swift
func dropDownMenu(dropDownMenu: JYDropDownMenu, didSelectMenuItemAtIndexPathRow indexPathRow: Int)
```

### Interface Builder
- From Interface Builder, drap and drop `UIView` onto your `View`.
- In `Identity Inspector`, set custom class `JYDropDownMenu`.
- Connect the `outlet` to your source file, e.g. `@IBOutlet weak var dropDownMenu: JYDropDownMenu!`

Create an array that contains strings as the elements of the JYDropDownMenu
```swift
let items: [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
```
- Instantiate the JYDropDownMenu
```swift
self.dropDownMenu = JYDropDownMenu(frame: self.dropDownMenu.frame, title: "Choose An Item", items: items)
```
Implement the delegate
```swift
self.dropDownMenu.delegate = self
```
Add the JYDropDownMenu as a `subview`.
```swift
self.view.addSubview(self.dropDownMenu)
```
Use delegate method to determine which item in the array was selected
```swift
func dropDownMenu(dropDownMenu: JYDropDownMenu, didSelectMenuItemAtIndexPathRow indexPathRow: Int)
```

### Customization
Once you have assigned the items and the frame of the JYDropDownMenu, you can customize the look of the menu. The following properties can be changed:

`width` **The width of the menu.**

`height` **The height of the menu.**

`title` **The title of the menu.**

`menuTitleTextAlignment` **The text alignment of the menu title.** *Default is NSTextAlignment.Center*

`menuBackgroundColor` **The background of the menu title.** *Default is NSTextAlignment.Center*