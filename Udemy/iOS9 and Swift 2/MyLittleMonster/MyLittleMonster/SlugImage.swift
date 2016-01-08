//
//  SlugImage.swift
//  MyLittleMonster
//
//  Created by Ilya Shaisultanov on 1/7/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation
import UIKit

class SlugImg: AnimatedImage {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.idlePrefix = "pink_idle"
        self.idleCount = 4
        self.deadPrefix = "pink_dead"
        self.deadCount = 3
        
        playIdleAnimation()
    }
}