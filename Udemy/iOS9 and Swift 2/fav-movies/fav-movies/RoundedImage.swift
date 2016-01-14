//
//  RoundedImage.swift
//  fav-movies
//
//  Created by Ilya Shaisultanov on 1/13/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {
    override func awakeFromNib() {
//        super.awakeFromNib()
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
}
