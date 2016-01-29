//
//  GameScene.swift
//  RetroSkate
//
//  Created by Ilya Shaisultanov on 1/28/16.
//  Copyright (c) 2016 Ilya Shaisultanov. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let ASP_PIECES = 15
    let GROUND_SPEED:CGFloat = -8.5
    let GROUND_X_RESET: CGFloat = -150
    
    var asphaltPieces = [SKSpriteNode]()
    var moveGroundAction: SKAction!
    var moveGroundActionForever: SKAction!
    
    override func didMoveToView(view: SKView) {
        setupBackground()
        setupGround()
    }

    override func update(currentTime: CFTimeInterval) {
        groundMovement()
    }
    
    func setupBackground() {
        moveGroundAction = SKAction.moveByX(GROUND_SPEED, y: 0, duration: 0.02)
        moveGroundActionForever = SKAction.repeatActionForever(moveGroundAction)
        
        let bg1 = SKSpriteNode(imageNamed: "bg1")
        bg1.position = CGPoint(x: 517, y: 400)
        bg1.zPosition = 3
        self.addChild(bg1)
        
        let bg2 = SKSpriteNode(imageNamed: "bg2")
        bg2.position = CGPoint(x: 517, y: 450)
        bg2.zPosition = 2
        self.addChild(bg2)
        
        let bg3 = SKSpriteNode(imageNamed: "bg3")
        bg3.position = CGPoint(x: 517, y: 500)
        bg3.zPosition = 1
        self.addChild(bg3)
    }
    
    func setupGround() {
        for i in 0...ASP_PIECES {
            let piece = SKSpriteNode(imageNamed: "asphalt")
            
            asphaltPieces.append(piece)

            if i == 0 {
                let position = CGPoint(x: 0, y: 144)
                piece.position = position
            } else {
                let previousPiecePosition = asphaltPieces[i - 1].position
                let position = CGPoint(x: piece.size.width + previousPiecePosition.x, y: previousPiecePosition.y)
                piece.position = position
            }
            
            piece.runAction(moveGroundActionForever)
            
            self.addChild(piece)
        }
    }
    
    func groundMovement() {
        for x in 0..<asphaltPieces.count {
            if asphaltPieces[x].position.x <= GROUND_X_RESET {
                var index: Int!
                
                if x == 0 {
                    index = asphaltPieces.count - 1
                } else {
                    index = x - 1
                }
                
                let newPos =  CGPoint(x: asphaltPieces[index].position.x + asphaltPieces[x].size.width, y: asphaltPieces[x].position.y)
                asphaltPieces[x].position = newPos
            }
        }
    }
}
