//
//  SecondViewController.swift
//  AnimalTrivia
//
//  Created by Ilya Shaisultanov on 1/1/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  @IBOutlet weak var aLabel: UILabel!
  @IBOutlet weak var bLabel: UILabel!
  @IBOutlet weak var cLabel: UILabel!
  
  @IBOutlet weak var aButton: UIButton!
  @IBOutlet weak var bButton: UIButton!
  @IBOutlet weak var cButton: UIButton!
  
  @IBOutlet weak var incorrectAImageView: UIImageView!
  @IBOutlet weak var correctBImageView: UIImageView!
  @IBOutlet weak var incorrectCImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func disableButtons () {
    let buttons = [aButton, bButton, cButton]
    
    for button in buttons {
      button.enabled = false
    }
  }
  
  @IBAction func aButtonPressed(sender: UIButton) {
    incorrectAImageView.hidden = false
    aButton.hidden = true
    
    aLabel.textColor = UIColor.redColor()
    
    disableButtons()
  }
  
  @IBAction func bButtonPressed(sender: UIButton) {
    correctBImageView.hidden = false
    bButton.hidden = true
    bLabel.textColor = UIColor.greenColor()
    disableButtons()
  }
  
  @IBAction func cButtonPressed(sender: UIButton) {
    incorrectCImageView.hidden = false
    cButton.hidden = true
    cLabel.textColor = UIColor.redColor()
    disableButtons()
  }
  
}
