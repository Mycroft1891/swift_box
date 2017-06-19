//
//  Blade.swift
//  Pierre Game
//
//  Created by Lisa on 6/19/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit

class Blade: SKSpriteNode, GameSprite {
    var initialSize: CGSize = CGSize(width: 185, height: 92)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Enemies")
    var spinAnimation: SKAction = SKAction()
    
    init() {
        super.init(texture: nil, color: .clear, size: initialSize)
        let startTexture = textureAtlas.textureNamed("blade")
        self.physicsBody = SKPhysicsBody(texture: startTexture, size: initialSize)
        self.physicsBody?.affectedByGravity = false
        createAnimation()
        self.run(spinAnimation)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func createAnimation() {
        let spinFrames: [SKTexture] = [
            textureAtlas.textureNamed("blade"),
            textureAtlas.textureNamed("blade-2")
        ]
        let spinAction = SKAction.animate(with: spinFrames, timePerFrame: 0.07)
        spinAnimation = SKAction.repeatForever(spinAction)
        
        
    }
    
    
    
    func onTap() {
        // todo
    }
}
