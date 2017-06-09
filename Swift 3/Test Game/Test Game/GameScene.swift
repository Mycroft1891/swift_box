//
//  GameScene.swift
//  Test Game
//
//  Created by Lisa on 5/20/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit
import GameplayKit

let wallMask : UInt32 = 0x1 << 0  // 1
let ballMask : UInt32 = 0x1 << 1  // 2
let sqrMask  : UInt32 = 0x1 << 2  // 4
let pegMask  : UInt32 = 0x1 << 3  // 8

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var cannon : SKSpriteNode!
    var square : SKSpriteNode!
    var touchLocation : CGPoint = CGPoint.zero
//    var ball : SKSpriteNode!
    
    override func didMove(to view: SKView) {
        cannon = self.childNode(withName: "cannon") as! SKSpriteNode
        square = self.childNode(withName: "sqaure") as! SKSpriteNode
//        ball = self.childNode(withName: "ball") as! SKSpriteNode
        self.physicsWorld.contactDelegate = self
        
        let degress = 90.0
        let rad = degress * .pi / 180.0
        let action = SKAction.rotate(byAngle: CGFloat(rad), duration: 1)
        square.run(SKAction.repeatForever(action))
        
        let backgroundSound = SKAudioNode(fileNamed: "bg.mp3")
        self.addChild(backgroundSound)
        
        backgroundSound.run(SKAction.play())

    }
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        touchLocation = touches.first!.location(in: self)
        // remove cannon sprite on touch
        // cannon.removeFromParent()
        
//        ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 10))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
        touchLocation = touches.first!.location(in: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        
        let ball: SKSpriteNode = SKScene(fileNamed: "Ball")!.childNode(withName: "ball")! as! SKSpriteNode
        ball.removeFromParent()
        self.addChild(ball)
        ball.position = cannon.position
        ball.zPosition = 0
        
        let angleRadians = Float(cannon.zRotation)
        let speed = CGFloat(75.0)
        let speedX = CGFloat(cosf(angleRadians)) * speed
        let speedY = CGFloat(sinf(angleRadians)) * speed
        
        ball.physicsBody?.applyImpulse(CGVector(dx: speedX, dy: speedY))
        ball.physicsBody?.collisionBitMask = wallMask | ballMask | pegMask
        ball.physicsBody?.contactTestBitMask = ball.physicsBody!.collisionBitMask | sqrMask
        
        self.run(SKAction.playSoundFileNamed("shoot.wav", waitForCompletion: true))
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        let percent = touchLocation.x / size.width
        let newAngle = percent * 180 - 90
        cannon.zRotation = CGFloat(newAngle) * .pi / 180.0
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let ball  = (contact.bodyA.categoryBitMask == ballMask) ? contact.bodyA : contact.bodyB
        let other = (ball == contact.bodyA) ? contact.bodyB : contact.bodyA
        
        switch other.categoryBitMask {
        case wallMask:
            print("We hit a wall")
        case sqrMask:
            print("We hit a square")
        case pegMask:
            print("We hit a peg")
        case ballMask:
            hitBall(ball: other)
        default:
            break
        }

    }
    
    func hitBall(ball: SKPhysicsBody) {
        print("We hit a ball")
        let spark = SKEmitterNode(fileNamed: "MyParticle")!
        spark.position = ball.node!.position
        self.addChild(spark)
        ball.node?.removeFromParent()
        
        self.run(SKAction.playSoundFileNamed("explosion.wav", waitForCompletion: true))
    }
}
