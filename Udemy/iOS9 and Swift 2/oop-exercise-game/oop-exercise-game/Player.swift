//
//  Player.swift
//  oop-exercise-game
//
//  Created by Ilya Shaisultanov on 1/5/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation

class Player {
    private var _name: String
    private var _hp: Int
    private var _attack: Int
    private var _type: String
    
    var type: String {
        return _type
    }
    
    var name: String {
        return _name
    }
    
    var hp: Int {
        return _hp
    }
    
    var attack: Int {
        return _attack
    }
    
    init(name: String, hp: Int, attack: Int, type: String) {
        _name = name
        _hp = hp
        _attack = attack
        _type = type
    }
    
    func isAlive() -> Bool {
        return _hp > 0
    }
    
    func performAttack (enemy: Player) {
        enemy.takeDamage(attack)
    }
    
    func takeDamage (dmg: Int) {
        let hp = _hp - dmg
        _hp = max(0, hp)
    }
}