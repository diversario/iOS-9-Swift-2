//
//  AnimatedImage.swift
//  MyLittleMonster
//
//  Created by Ilya Shaisultanov on 1/6/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation
import UIKit

class AnimatedImage: UIImageView {
    var idlePrefix: String!
    var idleCount: Int!
    var deadPrefix: String!
    var deadCount: Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func playIdleAnimation() {
        self.image = UIImage(named: "\(idlePrefix)1.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for var i in 1...idleCount {
            let img = UIImage(named: "\(idlePrefix)\(i).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDeathAnimation() {
        self.image = UIImage(named: "\(deadPrefix)\(deadCount).png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for var i in 1...deadCount {
            let img = UIImage(named: "\(deadPrefix)\(i).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }
}