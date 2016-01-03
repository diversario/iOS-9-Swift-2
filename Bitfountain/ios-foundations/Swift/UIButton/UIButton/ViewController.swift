//
//  ViewController.swift
//  UIButton
//
//  Created by Ilya Shaisultanov on 1/1/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var makeItBlueButton: UIButton!
    @IBOutlet weak var fireTheLazorsButton: UIButton!
    @IBOutlet weak var imageOnlyButton: UIButton!
    @IBOutlet weak var alternativeImageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func makeItBlueButtonPressed(sender: UIButton) {
        view.backgroundColor = UIColor.blueColor()
        
        makeItBlueButton.setTitle("bluenow", forState: UIControlState.Normal)
    }
    

    @IBAction func imageOnlyButtonPressed(sender: UIButton) {
        imageOnlyButton.setImage(UIImage(named: "nextButtonAlternative"), forState:
            UIControlState.Normal)
    }
    
    @IBAction func altNextButtPress(sender: UIButton) {
        alternativeImageButton.setImage(nil, forState: UIControlState.Normal)
        
        if (alternativeImageButton.backgroundImageForState(UIControlState.Normal) == UIImage(named: "redOval")) {
            alternativeImageButton.setBackgroundImage(UIImage(named: "greenOval"), forState: UIControlState.Normal)
        } else {
            alternativeImageButton.setBackgroundImage(UIImage(named: "redOval"), forState: UIControlState.Normal)
        }
        
        alternativeImageButton.setTitle("Butt", forState: UIControlState.Normal)
        
    }
}

