//
//  GameScene.swift
//  test-tvos-spritekit
//
//  Created by Ilya Shaisultanov on 1/28/16.
//  Copyright (c) 2016 Ilya Shaisultanov. All rights reserved.
//

import SpriteKit

var player: SKSpriteNode?
let playerColor = UIColor.orangeColor()
let playerSize = CGSize(width: 60, height: 60)

var offBlackColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)

var touchLocation: CGPoint?

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        spawnPlayer()
        
        self.backgroundColor = offBlackColor
        
        playerActions()
    }
    
    func spawnPlayer() {
        player = SKSpriteNode(color: playerColor, size: playerSize)
        player?.size = playerSize
        player?.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        self.addChild(player!)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            touchLocation = touch.locationInNode(self)
            movePlayerToTouch()
        }

    }

    func movePlayerToTouch () {
        player?.position.x = (touchLocation?.x)!
        player?.position.y = (touchLocation?.y)!
    }
    
    func playerActions(){
        let wait = SKAction.waitForDuration(2)
        let moveTo = SKAction.moveToX(250, duration: 1)
        let fadeOut = SKAction.fadeOutWithDuration(1)
        let fadeIn = SKAction.fadeInWithDuration(1)
        
        let seq = SKAction.sequence([wait, moveTo, fadeOut, fadeIn])
        player?.runAction(seq)
    }
    
    override func update(currentTime: CFTimeInterval) {
    }
}
