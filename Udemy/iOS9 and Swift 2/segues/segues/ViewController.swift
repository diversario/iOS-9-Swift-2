//
//  ViewController.swift
//  segues
//
//  Created by Ilya Shaisultanov on 1/8/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadBlue(sender: AnyObject!) {
        var str = "Fuuuuuuuuuuu"
        performSegueWithIdentifier("goToBlue", sender: str)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToBlue" {
            if let blueVC = segue.destinationViewController as? BlueViewController {
                if let theStr = sender as? String {
                    blueVC.transferText = theStr
                }
            }
        }
    }
}

