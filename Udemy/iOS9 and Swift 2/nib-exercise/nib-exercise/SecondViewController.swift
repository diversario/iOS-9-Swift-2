//
//  SecondViewController.swift
//  nib-exercise
//
//  Created by Ilya Shaisultanov on 1/8/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var v: ThirdViewController?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        v = ThirdViewController(nibName: "ThirdViewController", bundle: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func next(sender: UIButton!) {
        self.presentViewController(v!, animated: true, completion: nil)
    }

    @IBAction func back(sender: UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
