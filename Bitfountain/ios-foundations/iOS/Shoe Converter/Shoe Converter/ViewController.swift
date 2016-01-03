//
//  ViewController.swift
//  Shoe Converter
//
//  Created by Ilya Shaisultanov on 1/2/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mensConvertedShoeSizeLabel: UILabel!
    @IBOutlet weak var womensConvertedShoeSizeLabel: UILabel!

    @IBOutlet weak var mensShoeSizeTextField: UITextField!
    @IBOutlet weak var womensShoeSizeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func convertMensShoeSizePressed(sender: UIButton) {
        let size = Int(mensShoeSizeTextField.text!)!
        
        let conversionConstant = 30
        let convertedSize = conversionConstant + size
        mensConvertedShoeSizeLabel.text = "\(convertedSize) is \(size) in EU"
    }
    
    @IBAction func convertWomensShoeSizePressed(sender: UIButton) {
        let size = Double(womensShoeSizeTextField.text!)!
        
        let conversionConstant = 30.5
        let convertedSize = conversionConstant + size
        womensConvertedShoeSizeLabel.text = "\(convertedSize) is \(size) in EU"
    }
}

