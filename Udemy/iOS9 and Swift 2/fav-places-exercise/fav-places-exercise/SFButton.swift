//
//  SFButton.swift
//  fav-places-exercise
//
//  Created by Ilya Shaisultanov on 1/8/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class SFButton: UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = 4.0
        alpha = 0.9
        backgroundColor = UIColor(red:0.87, green:0.26, blue:0.19, alpha:1)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
}