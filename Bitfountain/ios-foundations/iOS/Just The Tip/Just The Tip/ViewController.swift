//
//  ViewController.swift
//  Just The Tip
//
//  Created by Ilya Shaisultanov on 1/2/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var totalBill: UITextField!
    
    @IBOutlet weak var tenPercent: UITextField!
    @IBOutlet weak var fifteenPercent: UITextField!
    @IBOutlet weak var twentyPercent: UITextField!
    
    @IBOutlet weak var customPercentage: UITextField!
    @IBOutlet weak var customPercent: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalBill.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func refreshButtonTapped(sender: UIButton) {
        calculateTip()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func calculateTip () {
        let billTotal = Double(totalBill.text!)
        let customTip = Double(customPercentage.text!)
        
        if let bill = billTotal {
            tenPercent.text = String(bill + bill * 0.1)
            fifteenPercent.text = String(bill + bill * 0.15)
            twentyPercent.text = String(bill + bill * 0.2)
            
            if let custom = customTip {
                customPercent.text = "\(bill + bill * custom * 0.01)"
            }
        } else {
            totalBill.placeholder = "Enter the total, dumbass"
        }
    }
}

