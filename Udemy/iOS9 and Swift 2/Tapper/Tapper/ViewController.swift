//
//  ViewController.swift
//  Tapper
//
//  Created by Ilya Shaisultanov on 1/3/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playButton: UIButton!

    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
        logoImage.hidden = true
        howManyTapsTxt.hidden = true
        playButton.hidden = true
        tapButton.hidden = false
        tapsLabel.hidden = false
    }
    
}

