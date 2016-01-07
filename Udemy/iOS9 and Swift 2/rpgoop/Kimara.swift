//
//  Kimara.swift
//  rpgoop
//
//  Created by Ilya Shaisultanov on 1/5/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Metal Cape", "Diamond Napkin", "Slightly Used Baguette"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
}