//
//  JYDropDownMenu.swift
//  Pods
//
//  Created by Jerry Yu on 3/2/16.
//
//

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
            return self.menuTitleTextAlignment
        }
        
        set (newValue) {
            self.menuTitleTextAlignment = newValue
        }
    }
    
    // The font of the menu title. Default is System Font with the size calculated by the calculateAdaptiveFontSize() method
    public var menuTitleFont: UIFont {
        get {
            return self.menuTitleFont
        }
        
        set (newValue) {
            self.menuTitleFont = newValue
        }
    }
    
    // The font of the menu items. Default is System Font with the size calculated by the calculateAdaptiveFontSize() method
    public var menuItemFont: UIFont {
        get {
            return self.menuTitleFont
        }
        
        set (newValue) {
            self.menuTitleFont = newValue
        }
    }
    
    // The font color of the menu title. Default is UIColor.darkGrayColor()
    public var menuTitleColor: UIColor {
        get {
            return self.menuTitleColor
        }
        
        set (newValue) {
            self.menuTitleColor = newValue
        }
    }
    
    // The font color of the menu items. Default is UIColor.darkGrayColor()
    public var menuItemColor: UIColor {
        get {
            return self.menuItemColor
        }
        
        set (newValue) {
            self.menuItemColor = newValue
        }
    }
    
    // whether the menu is currently dropped down or not
    public var isMenuShown: Bool!
    
    // the choices in the menu
    private var items: [AnyObject]!
    
    // the menu title label
    private var titleLabel: UILabel!
    
    // MARK: - Initialization
    
    public init(frame: CGRect, title: String, items: [AnyObject]) {
        super.init(frame: frame)
        
        setupViews(title, items: items)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting up the required views and properties
    
    private func setupViews(title: String, items: [AnyObject]) {
        //
    }
}