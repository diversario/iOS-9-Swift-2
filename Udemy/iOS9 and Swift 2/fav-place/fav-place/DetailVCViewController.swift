//
//  DetailVCViewController.swift
//  fav-place
//
//  Created by Ilya Shaisultanov on 1/8/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class DetailVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
