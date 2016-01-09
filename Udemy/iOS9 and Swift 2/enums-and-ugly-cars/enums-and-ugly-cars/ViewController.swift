//
//  ViewController.swift
//  enums-and-ugly-cars
//
//  Created by Ilya Shaisultanov on 1/9/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Cars: Int {
        case BMW = 0
        case HONDA = 1
        case TESLA = 2
        case SUBARU = 3
    }
    
    @IBOutlet weak var theLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var car1 = Cars.BMW
        var car2 = Cars.SUBARU
        
        if car1.rawValue == car2.rawValue {
            
        }
        
        if car1 == car2 {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onButtonTapped(sender: UIButton) {
        if sender.tag == Cars.BMW.rawValue {
            theLabel.text = Cars.BMW
        }
    }
}

