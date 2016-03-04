//
//  JYDropDownMenu.swift
//  Pods
//
//  Created by Jerry Yu on 3/2/16.
//  Copyright (c) 2016 Jerry Yu. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

// MARK: - JYDropDownMenuDelegate

@objc public protocol JYDropDownMenuDelegate {
    // Call after menu item is selected
    func dropDownMenu(dropDownMenu: JYDropDownMenu, didSelectMenuItemAtIndexPath indexPath: NSIndexPath)
}

public class JYDropDownMenu: UIView {
    // The width of the menu
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        
        set (newValue) {
            self.frame.size.width = newValue
        }
    }
    
    // The height of the menu
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        
        set (newValue) {
            self.frame.size.height = newValue
        }
    }
    
    // The title of the menu
    public var title: String {
        get {
            return self.titleLabel.text!
        }
        
        set (newValue) {
            self.titleLabel.text = newValue
        }
    }
    
    // The text alignment of the menu title. Default is NSTextAlignment.Left
    public var menuTitleTextAlignment: NSTextAlignment {
        get {
            return self.configuration.menuTitleTextAlignment
        }
        
        set (newValue) {
            self.configuration.menuTitleTextAlignment = newValue
        }
    }
    
    // The font of the menu title. Default is System Font with the size calculated by the calculateAdaptiveFontSize() method
    public var menuTitleFont: UIFont {
        get {
            return self.configuration.menuTitleFont
        }
        
        set (newValue) {
            self.configuration.menuTitleFont = newValue
        }
    }
    
    // The font of the menu items. Default is System Font with the size calculated by the calculateAdaptiveFontSize() method
    public var menuItemFont: UIFont {
        get {
            return self.configuration.menuItemFont
        }
        
        set (newValue) {
            self.configuration.menuItemFont = newValue
        }
    }
    
    // The font color of the menu title. Default is UIColor.darkGrayColor()
    public var menuTitleColor: UIColor! {
        get {
            return self.configuration.menuTitleColor
        }
        
        set (newValue) {
            self.configuration.menuTitleColor = newValue
        }
    }
    
    // The font color of the menu items. Default is UIColor.darkGrayColor()
    public var menuItemColor: UIColor! {
        get {
            return self.configuration.menuItemColor
        }
        
        set (newValue) {
            self.configuration.menuItemColor = newValue
        }
    }
    
    // Whether the menu is currently dropped down or not
    public var isMenuShown: Bool!
    
    // The JYDropDownMenuDelegate property
    weak public var delegate: JYDropDownMenuDelegate?
    
    // The default configuration
    private var configuration = JYConfiguration()
    
    // The choices in the menu
    private var items: [String]!
    
    // The menu title label
    private var titleLabel: UILabel!
    
    // MARK: - Initialization
    
    public init(frame: CGRect, title: String, items: [String]) {
        super.init(frame: frame)
        
        setupViews(frame, title: title, items: items)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting up the required views
    
    private func setupViews(frame: CGRect, title: String, items: [String]) {
        self.backgroundColor = UIColor.greenColor()
        
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        self.titleLabel.textAlignment = self.menuTitleTextAlignment
        self.titleLabel.textColor = self.menuTitleColor
        self.titleLabel.font = self.menuTitleFont
        self.titleLabel.text = title
        self.titleLabel.backgroundColor = self.configuration.menuBackgroundColor
        self.titleLabel.userInteractionEnabled = true
        
        let menuTitleLabelTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "showMenu")
        self.titleLabel.addGestureRecognizer(menuTitleLabelTapGestureRecognizer)
        
        self.addSubview(self.titleLabel)
        
        self.items = items
        
        self.isMenuShown = false
    }
    
    func showMenu() {
        // TODO: implement dropping down the menu
    }
}