//
//  Bat.swift
//  Pierre Game
//
//  Created by Lisa on 6/19/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit

class Bat: SKSpriteNode, GameSprite {
    var initialSize: CGSize = CGSize(width: 44, height: 24)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Enemies")
    var flyAnimation: SKAction = SKAction()
    
    init() {
        super.init(texture: nil, color: .clear, size: initialSize)
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
        self.physicsBody?.affectedByGravity = false
        createAnimation()
        self.run(flyAnimation)
    }
    
    func createAnimation() {
        let flyFrames: [SKTexture] = [
            textureAtlas.textureNamed("bat"),
            textureAtlas.textureNamed("bat-fly")
        ]
        
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.12)
        flyAnimation = SKAction.repeatForever(flyAction)
    }
    
    func onTap() {
        //todo
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
