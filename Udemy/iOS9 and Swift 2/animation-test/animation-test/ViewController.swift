//
//  ViewController.swift
//  animation-test
//
//  Created by Ilya Shaisultanov on 1/21/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var views: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        let floating = FloatingImageView(superview: self.view, imageName: "rain")
        floating.animate(10)
    }
}

