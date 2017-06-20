//
//  MadFly.swift
//  Pierre Game
//
//  Created by Lisa on 6/19/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit

class MadFly: SKSpriteNode, GameSprite {
    var initialSize: CGSize = CGSize(width: 61, height: 21)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Enemies")
    var flyAnimatiion: SKAction = SKAction()
    
    init() {
        super.init(texture: nil, color: .clear, size: initialSize)
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
        self.physicsBody?.affectedByGravity = false
        createAnimation()
        self.run(flyAnimatiion)
    }
    
    func createAnimation() {
        let flyFrames : [SKTexture] = [
            textureAtlas.textureNamed("madfly"),
            textureAtlas.textureNamed("madfly-fly")
        ]
        
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.14)
        flyAnimatiion = SKAction.repeatForever(flyAction)
    }
    
    func onTap() {
        // todo
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
