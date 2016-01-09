//
//  PhotoPageViewController.swift
//  fav-places-exercise
//
//  Created by Ilya Shaisultanov on 1/8/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class PhotoPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
