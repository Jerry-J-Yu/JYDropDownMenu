//
//  JYConfiguration.swift
//  Pods
//
//  Created by Jerry Yu on 3/4/16.
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

class JYConfiguration {
    var menuTitleBackgroundColor: UIColor?
    var menuTitleTextAlignment: NSTextAlignment!
    var menuTitleFont: UIFont!
    var menuItemFont: UIFont!
    var menuRowHeight: CGFloat!
    var menuTitleColor: UIColor?
    var menuItemColor: UIColor?
    
    init() {
        self.setDefaultValues()
    }
    
    func setDefaultValues() {
        self.menuTitleBackgroundColor = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        self.menuTitleTextAlignment = NSTextAlignment.Center
        self.menuTitleFont = UIFont.systemFontOfSize(17.0)
        self.menuItemFont = UIFont.systemFontOfSize(17.0)
        self.menuRowHeight = 21.0
        self.menuTitleColor = UIColor.darkGrayColor()
        self.menuItemColor = UIColor.darkGrayColor()
    }
}