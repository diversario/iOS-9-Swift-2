//
//  ViewController.swift
//  UISwitch
//
//  Created by Ilya Shaisultanov on 1/2/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var demoSwitch: UISwitch!
    @IBOutlet weak var switchStateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(patternImage: UIImage(named: "UISwitchBackground")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func changeSwitchTapped(sender: UIButton) {
        let yellow = UIColor(red: 255/255, green: 209/255, blue: 77/255, alpha: 1)
        let brown = UIColor(red: 108/255, green: 76/255, blue: 73/255, alpha: 1)
        
        if demoSwitch.on {
            demoSwitch.onTintColor = yellow
            demoSwitch.thumbTintColor = UIColor(red: 87/255, green: 175/255, blue: 63/255, alpha: 1)
        } else {
            demoSwitch.tintColor = brown
            demoSwitch.thumbTintColor = brown
            
        }
    }
    
    
    @IBAction func demoSwitchTapped(sender: UISwitch) {
        switchStateLabel.text = "Switch is \(demoSwitch.on)"
        
        let purple = UIColor(red: 189.255, green: 81/255, blue: 222/255, alpha: 1)
        
        demoSwitch.thumbTintColor = purple
    }
}

