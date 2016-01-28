//
//  GameScene.swift
//  space-shooter-tvos
//
//  Created by Ilya Shaisultanov on 1/28/16.
//  Copyright (c) 2016 Ilya Shaisultanov. All rights reserved.
//

import SpriteKit

var player = SKSpriteNode?()
var enemy = SKSpriteNode?()
var projectile = SKSpriteNode?()
var star = SKSpriteNode?()

let playerSize = CGSize(width: 50, height: 50)
let enemySize = CGSize(width: 40, height: 40)
let projectileSize = CGSize(width: 10, height: 10)
var starSize = CGSize?()

let offBlackColor = UIColor(hue: 0, saturation: 0, brightness: 0.2, alpha: 1)
let offWhiteColor = UIColor(hue: 0, saturation: 0, brightness: 0.95, alpha: 1)

var touchLocation = CGPoint?()

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        self.backgroundColor = offBlackColor
        spawnPlayer()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            touchLocation = touch.locationInNode(self)
        }
    }
   
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            touchLocation = touch.locationInNode(self)
            player?.position.y = (touchLocation?.y)!
            print(player?.position.y)
        }
    }
    
    func spawnPlayer(){
        player = SKSpriteNode(color: offWhiteColor, size: playerSize)
        player?.position = CGPoint(x: CGRectGetMinX(self.frame) + 50, y: CGRectGetMidY(self.frame))
        
        self.addChild(player!)
    }
    
    func keepPlayerOnScreen(){
        if player?.position.y >= 640 {
            player?.position.y = 640
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        //keepPlayerOnScreen()
    }
}
