//
//  Soldier.swift
//  oop-exercise-game
//
//  Created by Ilya Shaisultanov on 1/6/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation

class Soldier: Player {
    convenience init(name: String, hp: Int, attack: Int) {
        self.init(name: name, hp: hp, attack: attack, type: "Soldier")
    }
}