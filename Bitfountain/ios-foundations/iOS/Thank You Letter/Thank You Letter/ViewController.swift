//
//  ViewController.swift
//  Thank You Letter
//
//  Created by Ilya Shaisultanov on 12/31/15.
//  Copyright © 2015 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let toName = "Santa",
            message = "Please bring me a sex robot, a space truck and some computer parts.",
            fromName = "Jessie"
        
        toLabel.text = toName
        messageLabel.text = message
        fromLabel.text = fromName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

