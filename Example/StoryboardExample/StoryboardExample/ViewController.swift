//
//  ViewController.swift
//  StoryboardExample
//
//  Created by Jerry Yu on 3/9/16.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit
import JYDropDownMenu

class ViewController: UIViewController, JYDropDownMenuDelegate {
    @IBOutlet weak var dropDownMenu: JYDropDownMenu!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testItems: [String] = ["Water", "Apple Juice", "Wine", "Beer", "Lemonade", "Coke", "Pepsi", "Dr. Pepper", "Gatorade", "Coffee", "Tea", "Vodka", "Rum", "Whiskey", "Sprite", "Sunkist"]
        
        self.dropDownMenu = JYDropDownMenu(frame: self.dropdownmenutest.frame, title: "Choose A Drink", items: testItems)
        
        self.dropdownmenutest.delegate = self
        
        self.view.addSubview(self.dropdownmenutest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dropDownMenu(dropDownMenu: JYDropDownMenu, didSelectMenuItemAtIndexPathRow indexPathRow: Int) {
        print(indexPathRow)
    }
}