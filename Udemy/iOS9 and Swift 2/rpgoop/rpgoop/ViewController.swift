//
//  ViewController.swift
//  rpgoop
//
//  Created by Ilya Shaisultanov on 1/5/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var chestButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        playerHpLbl.text = "\(player.hp) HP"
        
        generateRandomEnemy()
    }

    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        } else {
            enemy = DeviledWizard(startingHp: 60, attackPwr: 15)
        }
        
        enemyImg.hidden = false
        enemyHpLbl.text = "\(enemy.hp) HP"
    }
    
    @IBAction func onChestTapped(sender: UIButton) {
        chestButton.hidden = true
        printLbl.text = chestMessage
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    @IBAction func attackTapped(sender: UIButton) {
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP."
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
    }
}

