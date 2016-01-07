//
//  Enemy.swift
//  rpgoop
//
//  Created by Ilya Shaisultanov on 1/5/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation

class Enemy: Character {
    var loot: [String] {
        return ["Shitty Sword", "Straightened Wine key"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
}
