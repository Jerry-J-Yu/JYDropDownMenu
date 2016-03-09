//
//  ViewController.swift
//  ProgrammaticallyExample
//
//  Created by Jerry Yu on 3/9/16.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit
import JYDropDownMenu

class ViewController: UIViewController, JYDropDownMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testItems: [String] = ["Pizza", "Hamburger", "French Fries", "Salad", "Dumplings", "Mashed Potatoes", "Fish Fillet", "Ice Cream", "Broccoli", "Peanut Butter", "Yogurt", "Green Beans", "Snickers", "Omelet", "Noodles", "Subway Sandwich"]
        
        let dropDownMenu = JYDropDownMenu(frame: CGRect(x: 50, y: 100, width: 260, height: 40), title: "Choose A Food", items: testItems)
        
        dropDownMenu.delegate = self
        
        self.view.addSubview(dropDownMenu)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dropDownMenu(dropDownMenu: JYDropDownMenu, didSelectMenuItemAtIndexPathRow indexPathRow: Int) {
        print(indexPathRow)
    }
}