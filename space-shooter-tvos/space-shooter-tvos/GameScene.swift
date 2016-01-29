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

var lblMain = SKLabelNode()
var lblScore = SKLabelNode()

let playerSize = CGSize(width: 50, height: 50)
let enemySize = CGSize(width: 40, height: 40)
let projectileSize = CGSize(width: 10, height: 10)
var starSize = CGSize?()

let enemySpeed = 2.0
let enemySpawnRate = 1.0

let projectileSpeed = 2.0
let projectileSpawnRate = 0.1

let offBlackColor = UIColor(hue: 0, saturation: 0, brightness: 0.2, alpha: 1)
let offWhiteColor = UIColor(hue: 0, saturation: 0, brightness: 0.95, alpha: 1)

var touchLocation = CGPoint?()

var isAlive = true

struct physicsCategory {
    static let player: UInt32 = 1
    static let projectile: UInt32 = 2
    static let enemy: UInt32 = 3
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var score = 0
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = offBlackColor
        
        physicsWorld.contactDelegate = self
        
        spawnPlayer()
        timerEnemySpawn()
        timerStarSpawn()
        timerSpawnProjectile()
        spawnLabelMain()
        spawnLabelScore()
        
        timerLblMainAlpha()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            touchLocation = touch.locationInNode(self)
        }
    }
   
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            touchLocation = touch.locationInNode(self)
            
            if isAlive {
                player?.position.y = (touchLocation?.y)!
            }
        }
    }
    
    func spawnPlayer(){
        player = SKSpriteNode(color: offWhiteColor, size: playerSize)
        player?.position = CGPoint(x: CGRectGetMinX(self.frame) + 100, y: CGRectGetMidY(self.frame))
        
        player!.name = "playerName"
        
        player?.physicsBody = SKPhysicsBody(rectangleOfSize: player!.size)
        player?.physicsBody?.affectedByGravity = false
        player?.physicsBody?.allowsRotation = false
        player?.physicsBody?.categoryBitMask = physicsCategory.player
        player?.physicsBody?.contactTestBitMask = physicsCategory.enemy
        player?.physicsBody?.dynamic = true
        
        self.addChild(player!)
    }
    
    func spawnEnemy () {
        let randomY = Int(arc4random_uniform(550) + 140)
        
        enemy = SKSpriteNode(color: offWhiteColor, size: enemySize)
        enemy?.position = CGPoint(x: 1200, y: randomY)
        
        enemy!.name = "enemyName"
        
        enemy?.physicsBody = SKPhysicsBody(rectangleOfSize: enemy!.size)
        enemy?.physicsBody?.affectedByGravity = false
        enemy?.physicsBody?.allowsRotation = false
        enemy?.physicsBody?.categoryBitMask = physicsCategory.enemy
        enemy?.physicsBody?.contactTestBitMask = physicsCategory.player
        enemy?.physicsBody?.dynamic = true
        
        
        moveEnemyForward()
        self.addChild(enemy!)
    }
    
    func moveEnemyForward(){
        let moveForward = SKAction.moveToX(-100, duration: enemySpeed)
        let destroy = SKAction.removeFromParent()
        
        enemy?.runAction(SKAction.sequence([moveForward, destroy]))
    }
    
    func timerEnemySpawn(){
        let wait = SKAction.waitForDuration(enemySpawnRate)
        let spawn = SKAction.runBlock {
            self.spawnEnemy()
        }
        
        let seq = SKAction.sequence([wait, spawn])
        self.runAction(SKAction.repeatActionForever(seq))
    }
    
    
    func timerStarSpawn(){
        let wait = SKAction.waitForDuration(0.1)
        let spawn = SKAction.runBlock {
            self.spawnStar()
        }
        
        let seq = SKAction.sequence([wait, spawn])
        self.runAction(SKAction.repeatActionForever(seq))
    }
    
    func moveStarForward(){
        let speed = Double(Int(arc4random_uniform(3) + 1))
        
        let moveForward = SKAction.moveToX(-100, duration: speed)
        let destroy = SKAction.removeFromParent()
        
        star?.runAction(SKAction.sequence([moveForward, destroy]))
    }

    func spawnStar(){
        let w = Int(arc4random_uniform(3) + 1)
        let h = Int(arc4random_uniform(3) + 1)
        
        let randomY = Int(arc4random_uniform(550) + 125)
        
        starSize = CGSize(width: w, height: h)
        star = SKSpriteNode(color: offWhiteColor, size: starSize!)
        
        star?.position = CGPoint(x: 1200, y: randomY)
        star?.zPosition = -1
        
        moveStarForward()
        self.addChild(star!)
    }
    
    func moveProjectileForward(){
        let moveForward = SKAction.moveToX(1200, duration: projectileSpeed)
        let destroy = SKAction.removeFromParent()
        
        projectile?.runAction(SKAction.sequence([moveForward, destroy]))
    }
    
    func timerSpawnProjectile(){
        let wait = SKAction.waitForDuration(projectileSpawnRate)
        let spawn = SKAction.runBlock {
            self.spawnProjectile()
        }
        
        let seq = SKAction.sequence([wait, spawn])
        self.runAction(SKAction.repeatActionForever(seq))
    }
    
    func spawnProjectile(){
        projectile = SKSpriteNode(color: offWhiteColor, size: projectileSize)
        projectile?.position.y = (player?.position.y)!
        projectile?.position.x = (player?.position.x)!
        
        projectile?.name = "projectileName"
        
        
        projectile?.physicsBody = SKPhysicsBody(rectangleOfSize: projectile!.size)
        projectile?.physicsBody?.affectedByGravity = false
        projectile?.physicsBody?.allowsRotation = false
        projectile?.physicsBody?.categoryBitMask = physicsCategory.projectile
        projectile?.physicsBody?.contactTestBitMask = physicsCategory.enemy
        projectile?.physicsBody?.dynamic = true
        
        moveProjectileForward()
        self.addChild(projectile!)
    }
    
    func keepPlayerOnScreen(){
        if player?.position.y >= 640 {
            player?.position.y = 640
        }
        
        if player?.position.y <= 125 {
           player?.position.y = 125
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        keepPlayerOnScreen()
        movePlayerOffScreen()
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        let fBody = contact.bodyA
        let sBody = contact.bodyB
        
        let collisionType = [fBody.categoryBitMask, sBody.categoryBitMask].sort(>)
        
        if collisionType == [physicsCategory.player, physicsCategory.enemy].sort(>) {
            playerEnemyCollision(fBody.node as! SKSpriteNode, contactB: sBody.node as! SKSpriteNode)
        }
        
        if collisionType == [physicsCategory.projectile, physicsCategory.enemy].sort(>) {
            projectileEnemyCollision(fBody.node as! SKSpriteNode, contactB: sBody.node as! SKSpriteNode)
        }
    }
    
    func playerEnemyCollision(contactA: SKSpriteNode, contactB: SKSpriteNode) {
        let nodes = [contactA, contactB]
        let enemy = nodes.filter { $0.name == "enemyName"} [0]
        
        enemy.removeFromParent()
        
        isAlive = false
        gameOverLogic()
    }
    
    func projectileEnemyCollision(contactA: SKSpriteNode, contactB: SKSpriteNode) {
        let nodes = [contactA, contactB]
        let enemy = nodes.filter { $0.name == "enemyName"} [0]
        
        enemy.removeFromParent()
        score += 1
        updateScore()
    }
    
    func updateScore () {
        lblScore.text = "\(score)"
    }
    
    func gameOverLogic () {
        lblMain.alpha = 1
        lblMain.text = "Game Over"
        
        resetGame()
    }
    
    func movePlayerOffScreen () {
        if isAlive == false {
            player?.position.y = -300
        }
    }
    
    func timerLblMainAlpha () {
        let wait = SKAction.waitForDuration(3)
        let changeAlpha = SKAction.runBlock {
            lblMain.alpha = 0
        }
        
        let seq = SKAction.sequence([wait, changeAlpha])
        self.runAction(seq)
    }
    
    func spawnLabelMain () {
        lblMain = SKLabelNode(fontNamed: "Futura")
        lblMain.fontSize = 150
        lblMain.fontColor = offWhiteColor
        lblMain.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) + 50)
        lblMain.text = "Start!"
        
        self.addChild(lblMain)
    }
    
    func spawnLabelScore () {
        lblScore = SKLabelNode(fontNamed: "Futura")
        lblScore.fontSize = 30
        lblScore.fontColor = offWhiteColor
        lblScore.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMinY(self.frame) + 170)
        lblScore.text = "\(score)"
        
        self.addChild(lblScore)
    }
    
    func resetGame() {
        let wait = SKAction.waitForDuration(1)
        let gameScene = GameScene(size: self.size)
        gameScene.scaleMode = .AspectFill
        
        let trans = SKTransition.crossFadeWithDuration(1)
        
        let changeScene = SKAction.runBlock {
            self.scene?.view?.presentScene(gameScene, transition: trans)
        }
        
        let seq = SKAction.sequence([wait, changeScene])
        self.runAction(seq)
    }
}
