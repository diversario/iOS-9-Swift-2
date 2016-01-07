//
//  Game.swift
//  oop-exercise-game
//
//  Created by Ilya Shaisultanov on 1/6/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation

class Game {
    private var _players: [Player]
    private var _turn: Int
    private var _winner: Player?
    
    func getPlayer(i: Int) -> Player? {
        if i < _players.count {
            return _players[i]
        }
        
        return nil
    }
    
    init (playerCount: Int) {
        _players = [Player]()
        
        for var i in 0..<playerCount {
            if i % 2 == 0 {
                let player = Orc(name: "Player \(i + 1)", hp: 80 + Int(arc4random_uniform(UInt32(20))), attack: 10 + Int(arc4random_uniform(UInt32(10))))
                _players.append(player)
            } else {
                let player = Soldier(name: "Player \(i + 1)", hp: 80 + Int(arc4random_uniform(UInt32(20))), attack: 10 + Int(arc4random_uniform(UInt32(10))))
                _players.append(player)            }
        }
        
        _turn = 0
    }
    
    func nextTurnPlayer () -> Player {
        let turn = _turn++ % _players.count
        return _players[turn]
    }
    
    func isOver () -> Player? {
        let winner = _players.filter({$0.hp > 0})
        
        if winner.count == 1 {
            return winner[0]
        }
        
        return nil
    }
}