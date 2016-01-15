//
//  FancyButton.swift
//  fav-movies
//
//  Created by Ilya Shaisultanov on 1/15/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class FancyButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor(white: 1, alpha: 0.5)
        self.tintColor = UIColor.whiteColor()
    }
}
