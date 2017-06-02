//
//  GameScene.swift
//  Test Game
//
//  Created by Lisa on 5/20/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var cannon : SKSpriteNode!
    var touchLocation : CGPoint = CGPoint.zero
//    var ball : SKSpriteNode!
    
    override func didMove(to view: SKView) {
        cannon = self.childNode(withName: "cannon") as! SKSpriteNode
//        ball = self.childNode(withName: "ball") as! SKSpriteNode
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
}
