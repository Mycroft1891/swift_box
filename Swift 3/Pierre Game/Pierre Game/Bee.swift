//
//  Bee.swift
//  Pierre Game
//
//  Created by Lisa on 6/15/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit

class Bee: SKSpriteNode, GameSprite {
    
    var initialSize: CGSize = CGSize(width: 28, height: 24)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Enemies")
    var flyAnimation = SKAction()
    
    init() {
        super.init(texture: nil, color: .clear, size: initialSize)
        createAnimations()
        self.run(flyAnimation)
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.affectedByGravity = false
    }
    
    func createAnimations() {
        
        let beeFrames : [SKTexture] = [
            textureAtlas.textureNamed("bee"),
            textureAtlas.textureNamed("bee-fly")
        ]
        
        let flyAction = SKAction.animate(with: beeFrames, timePerFrame: 0.14)
        flyAnimation = SKAction.repeatForever(flyAction)
    }
    
    func onTap() {
        // todo
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
