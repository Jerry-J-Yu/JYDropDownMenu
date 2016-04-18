//
//  JYTableViewCell.swift
//  Pods
//
//  Created by Jerry Yu on 3/7/16.
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

class JYTableViewCell: UITableViewCell {
    let horizontalMargin: CGFloat = 20
    
    var cellContentFrame: CGRect!
    var configuration: JYConfiguration!
    
    // MARK: - Initialization
    
    init(frame: CGRect, style: UITableViewCellStyle, reuseIdentifier: String?, configuration: JYConfiguration) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configuration = configuration
        self.cellContentFrame = CGRect(x: 0, y: 0, width: frame.size.width, height: self.configuration.menuRowHeight)
        self.textLabel?.textColor = self.configuration.menuItemColor
        self.textLabel?.font = self.configuration.menuItemFont
        self.textLabel?.textAlignment = NSTextAlignment.Left
        self.textLabel?.numberOfLines = 0
        
        self.textLabel?.frame = CGRect(x: horizontalMargin, y: 0, width: self.cellContentFrame.width - horizontalMargin, height: self.cellContentFrame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}