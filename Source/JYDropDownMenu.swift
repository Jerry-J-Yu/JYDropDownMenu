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
    func dropDownMenu(dropDownMenu: JYDropDownMenu, didSelectMenuItemAtIndexPathRow indexPathRow: Int)
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
            // Cap the height of the menu at ten items
            if (self.items.count <= 10) {
                return self.configuration.menuRowHeight * CGFloat(self.items.count)
            } else {
                return self.configuration.menuRowHeight * 10.0
            }
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
    
    // The background color of the menu title. Default is UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
    public var menuTitleBackgroundColor: UIColor! {
        get {
            return self.configuration.menuTitleBackgroundColor
        }
        
        set (newValue) {
            self.titleLabel.backgroundColor = newValue
        }
    }
    
    // The text alignment of the menu title. Default is NSTextAlignment.Center
    public var menuTitleTextAlignment: NSTextAlignment {
        get {
            return self.configuration.menuTitleTextAlignment
        }
        
        set (newValue) {
            self.titleLabel.textAlignment = newValue
        }
    }
    
    // The font of the menu title. Default is System Font, size 17.0
    public var menuTitleFont: UIFont {
        get {
            return self.configuration.menuTitleFont
        }
        
        set (newValue) {
            self.titleLabel.font = newValue
        }
    }
    
    // The font of the menu items. Default is System Font, size 17.0
    public var menuItemFont: UIFont {
        get {
            return self.configuration.menuItemFont
        }
        
        set (newValue) {
            self.configuration.menuItemFont = newValue
        }
    }
    
    // The cell height of the menu items. Default is 21.0
    public var menuRowHeight: CGFloat {
        get {
            return self.tableView.rowHeight
        }
        
        set (newValue) {
            self.tableView.rowHeight = newValue
        }
    }
    
    // The font color of the menu title. Default is UIColor.darkGrayColor()
    public var menuTitleColor: UIColor! {
        get {
            return self.configuration.menuTitleColor
        }
        
        set (newValue) {
            self.titleLabel.textColor = newValue
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
    
    // The TableView representing the menu items
    private var tableView: JYTableView!
    
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
        super.init(coder: aDecoder)
        
        setupViews(frame, title: "", items: [])
    }
    
    // MARK: - Setting up the required views
    
    private func setupViews(frame: CGRect, title: String, items: [String]) {
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        self.titleLabel.textAlignment = self.menuTitleTextAlignment
        self.titleLabel.textColor = self.menuTitleColor
        self.titleLabel.font = self.menuTitleFont
        self.titleLabel.text = title
        self.titleLabel.backgroundColor = self.configuration.menuTitleBackgroundColor
        self.titleLabel.numberOfLines = 0
        self.titleLabel.userInteractionEnabled = true
        
        let menuTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "animateMenu")
        self.titleLabel.addGestureRecognizer(menuTapGestureRecognizer)
        
        self.addSubview(self.titleLabel)
        
        self.items = items
        self.isMenuShown = false
        
        // Make the TableView hidden initially
        let tableViewHiddenFrame: CGRect = CGRect(x: frame.origin.x, y: frame.origin.y + frame.size.height, width: frame.size.width, height: 0)
        self.tableView = JYTableView(frame: tableViewHiddenFrame, items: self.items, configuration: self.configuration)
        
        self.tableView.selectRowAtIndexPathHandler = { (indexPathRow: Int) -> () in
            // Pass the data through the delegate to the view controller containing the JYDropDownMenu
            self.delegate?.dropDownMenu(self, didSelectMenuItemAtIndexPathRow: indexPathRow)
            
            // Change the menu title to the selected item
            self.title = self.items[indexPathRow]
            
            // Animate the menu
            self.animateMenu()
        }
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.superview?.addSubview(self.tableView)
    }
    
    func animateMenu() {
        if (!self.isMenuShown) {
            self.isMenuShown = true
            
            // Remove the zero-height TableView from the superview
            self.tableView.removeFromSuperview()
            
            // Animate in the newly resized TableView
            UIView.animateWithDuration(0.5, animations: {
                var tableViewShownFrame = self.tableView.frame
                tableViewShownFrame.size.height = self.height
                self.tableView.frame = tableViewShownFrame
                self.superview?.addSubview(self.tableView)
            })
        } else {
            self.tableView.reloadData()
            
            // Update TableView layout immediately or else
            // reloadData() will interrupt the subsequent animation
            self.tableView.layoutIfNeeded()
            
            self.isMenuShown = false
            
            // Remove the normal-sized TableView from the superview
            self.tableView.removeFromSuperview()
            
            // Animate in the zero-height TableView
            UIView.animateWithDuration(0.5, animations: {
                var tableViewShownFrame = self.tableView.frame
                tableViewShownFrame.size.height = 0
                self.tableView.frame = tableViewShownFrame
                self.superview?.addSubview(self.tableView)
            })
        }
    }
}