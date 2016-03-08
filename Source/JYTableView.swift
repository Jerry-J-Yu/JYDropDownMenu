//
//  JYTableView.swift
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

class JYTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    // The configuration of the TableView
    var configuration: JYConfiguration!
    
    // The callback when an indexPath is selected
    var selectRowAtIndexPathHandler: ((indexPathRow: Int) -> ())?
    
    // The selected indexPath.row
    var selectedIndexPathRow: Int!
    
    // The choices of the TableView
    private var items: [String]!
    
    // MARK: - Initialization
    
    init(frame: CGRect, items: [String], configuration: JYConfiguration) {
        super.init(frame: frame, style: UITableViewStyle.Plain)
        
        self.items = items
        self.selectedIndexPathRow = -1
        self.configuration = configuration
        
        // Add a border to the TableView
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 10.0
        
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented!")
    }
    
    // MARK: - TableView data source
    
    override func numberOfRowsInSection(section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = JYTableViewCell(frame: frame, style: UITableViewCellStyle.Default, reuseIdentifier: "Cell", configuration: self.configuration)
        
        cell.textLabel?.text = self.items[indexPath.row]
        cell.accessoryType = (indexPath.row == self.selectedIndexPathRow) ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    // MARK: - TableView delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedIndexPathRow = indexPath.row
        self.selectRowAtIndexPathHandler!(indexPathRow: indexPath.row)
    }
}