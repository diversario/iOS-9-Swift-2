//
//  Character.swift
//  rpgoop
//
//  Created by Ilya Shaisultanov on 1/5/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackPwr = 10
    
    var attackPwr: Int {
        return _attackPwr
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            return hp > 0
        }
    }
    
    init(startingHp: Int, attackPwr: Int) {
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        return true
    }
}