//
//  BackButton.swift
//  fav-places-exercise
//
//  Created by Ilya Shaisultanov on 1/8/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class BackButton: UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = 4.0
        alpha = 0.9
        backgroundColor = UIColor(red:1, green:1, blue:1, alpha:0.3)
        setTitleColor(UIColor.blackColor(), forState: .Normal)
    }
}
