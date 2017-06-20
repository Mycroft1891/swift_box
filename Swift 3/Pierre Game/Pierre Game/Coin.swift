//
//  Coin.swift
//  Pierre Game
//
//  Created by Lisa on 6/19/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit

class Coin: SKSpriteNode, GameSprite {
    var initialSize: CGSize = CGSize(width: 26, height: 26)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Environments")
    var value = 1
    
    init() {
        let bronzeTexture = textureAtlas.textureNamed("coin-bronze")
        super.init(texture: bronzeTexture, color: .clear, size: initialSize)
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
        self.physicsBody?.affectedByGravity = false
    }
    
    func turnToGold() {
        self.texture = textureAtlas.textureNamed("coin-gold")
    }
    
    func onTap() {
        // todo
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
