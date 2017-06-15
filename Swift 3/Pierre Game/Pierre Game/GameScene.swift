//
//  GameScene.swift
//  Pierre Game
//
//  Created by Lisa on 6/14/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        self.anchorPoint = .zero
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        let bee = SKSpriteNode()
        bee.size = CGSize(width: 28, height: 24)
        bee.position = CGPoint(x: 250, y: 250)
        self.addChild(bee)
        
        let beeAtlas = SKTextureAtlas(named: "Enemies")
        let beeFrames : [SKTexture] = [
            beeAtlas.textureNamed("bee"),
            beeAtlas.textureNamed("bee-fly")
        ]
        
        let flyAction = SKAction.animate(with: beeFrames, timePerFrame: 0.14)
        let beeAction = SKAction.repeatForever(flyAction)
        
        bee.run(beeAction)
        
        let pathLeft = SKAction.moveBy(x: -200, y: -10, duration: 2)
        let pathRight = SKAction.moveBy(x: 200, y: 10, duration: 2)
        
        let textureNegative = SKAction.scaleX(to: -1, duration: 0)
        let texturePositive = SKAction.scaleX(to: 1, duration: 0)
        
        let flySequence = SKAction.sequence([pathLeft, textureNegative, pathRight, texturePositive])
        let infinitFly  = SKAction.repeatForever(flySequence)
        
        bee.run(infinitFly)
        
    }
}
