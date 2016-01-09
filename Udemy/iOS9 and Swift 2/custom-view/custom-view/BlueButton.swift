//
//  BlueButton.swift
//  custom-view
//
//  Created by Ilya Shaisultanov on 1/8/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class BlueButton: UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        backgroundColor = UIColor(red: 46.0/255.0, green: 135/255, blue: 195/255, alpha: 1)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
}
