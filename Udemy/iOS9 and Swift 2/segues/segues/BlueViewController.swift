//
//  BlueViewController.swift
//  segues
//
//  Created by Ilya Shaisultanov on 1/8/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    var transferText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mainLabel.text = transferText
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
