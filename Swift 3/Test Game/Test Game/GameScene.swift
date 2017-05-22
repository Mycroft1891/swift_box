//
//  GameScene.swift
//  Test Game
//
//  Created by Lisa on 5/20/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var cannon : SKSpriteNode!
    var touchLocation : CGPoint = CGPoint.zero
    
    override func didMove(to view: SKView) {
        cannon = self.childNode(withName: "cannon") as! SKSpriteNode
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
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
        touchLocation = touches.first!.location(in: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
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
