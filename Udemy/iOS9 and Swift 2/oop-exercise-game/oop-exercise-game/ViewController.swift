//
//  ViewController.swift
//  oop-exercise-game
//
//  Created by Ilya Shaisultanov on 1/5/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var game: Game!
    
    @IBOutlet weak var player1HpLabel: UILabel!
    @IBOutlet weak var player2HpLabel: UILabel!
    
    @IBOutlet weak var p1AttackBtn: UIButton!
    @IBOutlet weak var p2AttackBtn: UIButton!
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func onAttackBtn(sender: UIButton) {
        let player: Player
        let enemy: Player
        
        if sender.tag == 0 {
            player = game.getPlayer(0)!
            enemy = game.getPlayer(1)!
        } else {
            player = game.getPlayer(1)!
            enemy = game.getPlayer(0)!
        }
        
        player.performAttack(enemy)
        updateHpLabels()
        
        if let winner = game.isOver() {
            infoLabel.text = "\(winner.name) won!"
            playButton.hidden = false
            p1AttackBtn.enabled = false
            p2AttackBtn.enabled = false
        } else {
            setPlayerButtonState((sender.tag + 1) % 2, state: false)
            
            delay(1.0) {
                self.setPlayerButtonState((sender.tag + 1) % 2, state: true)
            }
        }
    }
    
    func setPlayerButtonState(player: Int, state: Bool) {
        if player == 0 {
            p1AttackBtn.enabled = state
        } else {
            p2AttackBtn.enabled = state
        }
    }
    
    func delay(delay: Double, closure: ()->()) {
        // A handy bit of code created by Matt Neuburg, author of a lot of books including
        // iOS Programming Fundamentals with Swift (O'Reilly 2015).
        // See his reply in Stack Overflow for details:
        // http://stackoverflow.com/questions/24034544/dispatch-after-gcd-in-swift/24318861#24318861
        //
        // The secret sauce is Grand Central Dispatch's (GCD) dispatch_after() function.
        // Ray Wenderlich has a good tutorial on GCD at:
        // http://www.raywenderlich.com/79149/grand-central-dispatch-tutorial-swift-part-1
        
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(),
            closure
        )
    }
    
    @IBAction func onPlayButton(sender: UIButton) {
        game = Game(playerCount: 2)
        updateHpLabels()
        infoLabel.text = "Kill!"
        playButton.hidden = true
        p1AttackBtn.enabled = true
        p2AttackBtn.enabled = true
    }
    
    func updateHpLabels() {
        player1HpLabel.text = "\(game.getPlayer(0)!.hp) HP"
        player2HpLabel.text = "\(game.getPlayer(1)!.hp) HP"
    }
}

