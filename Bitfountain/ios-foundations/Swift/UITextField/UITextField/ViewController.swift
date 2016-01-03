//
//  ViewController.swift
//  UITextField
//
//  Created by Ilya Shaisultanov on 1/2/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var borderLabel: UILabel!
    
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionButtonPressed(sender: UIButton) {
        nameTextField.textColor = UIColor.redColor()
        nameTextField.backgroundColor = UIColor.whiteColor()
        
        nameTextField.textAlignment = .Right
        
        var currentStyle: String = "Default"
        
        if nameTextField.borderStyle == UITextBorderStyle.None {
            nameTextField.borderStyle = .Line
            currentStyle = "Line"
        } else if nameTextField.borderStyle == .Line {
            nameTextField.borderStyle = .Bezel
            currentStyle = "Bezel"
        } else if nameTextField.borderStyle == .Bezel {
            nameTextField.borderStyle = .RoundedRect
            currentStyle = "RoundedRect"
        } else {
            nameTextField.borderStyle = .None
            currentStyle = "None"
        }
        
        messageLabel.text = "What up \(nameTextField.text!)"
        borderLabel.text = "Border is \(currentStyle)"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

