//
//  Player.swift
//  Pierre Game
//
//  Created by Lisa on 6/15/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode, GameSprite {
    
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Pierre")
    var initialSize: CGSize  = CGSize(width: 64, height: 64)
    var flapping : Bool = false
    let maxFlappingForce : CGFloat = 57000
    let maxHeight : CGFloat = 1000
    
    var flyUpAnimation = SKAction()
    var flyDownAnimation = SKAction()
    
    init() {
        super.init(texture: nil, color: .clear, size: initialSize)
        
        createAnimations()
        self.run(flyDownAnimation, withKey: "flyDownAnimation")
        
        let bodyTexture = textureAtlas.textureNamed("pierre-flying-3")
        self.physicsBody = SKPhysicsBody(texture: bodyTexture, size: self.size)
        self.physicsBody?.linearDamping = 0.9
        self.physicsBody?.mass = 30
        self.physicsBody?.allowsRotation = false
    }
    
    func update() {
        guard self.flapping else { return }
            var forceToApply = maxFlappingForce
            if position.y > 600 {
                let percentageOfMaxHeight = position.y / maxHeight
                let flappingForceSubstraction = percentageOfMaxHeight * maxFlappingForce
                forceToApply -= flappingForceSubstraction
            }
            self.physicsBody?.applyForce(CGVector(dx: 0, dy: forceToApply))
            if self.physicsBody!.velocity.dy > 300 {
                self.physicsBody!.velocity.dy = 300
            }
            self.physicsBody?.velocity.dx = 200
    }
    
    func createAnimations() {
        let rotateUpAction = SKAction.rotate(toAngle: 0, duration: 0.475)
        rotateUpAction.timingMode = .easeOut
        
        let rotateDownAction = SKAction.rotate(toAngle: -1, duration: 0.8)
        rotateDownAction.timingMode = .easeIn
        
        let flyUpFrames : [SKTexture] = [
            textureAtlas.textureNamed("pierre-flying-1"),
            textureAtlas.textureNamed("pierre-flying-2"),
            textureAtlas.textureNamed("pierre-flying-3"),
            textureAtlas.textureNamed("pierre-flying-4"),
            textureAtlas.textureNamed("pierre-flying-3"),
            textureAtlas.textureNamed("pierre-flying-2")
        ]
        
        let flyDownFrames : [SKTexture] = [
            textureAtlas.textureNamed("pierre-flying-1")
        ]
        
        let flyUpAction = SKAction.animate(with: flyUpFrames, timePerFrame: 0.03)
        let flyDownAction = SKAction.animate(with: flyDownFrames, timePerFrame: 1)
        
        flyUpAnimation = SKAction.group([SKAction.repeatForever(flyUpAction), rotateUpAction])
        flyDownAnimation = SKAction.group([SKAction.repeatForever(flyDownAction), rotateDownAction])
    }
    
    func startFlapping() {
        self.removeAction(forKey: "flyDownAnimation")
        self.run(flyUpAnimation, withKey: "flyUpAnimation")
        self.flapping = true
    }
    
    func stopFlapping() {
        self.removeAction(forKey: "flyUpAnimation")
        self.run(flyDownAnimation, withKey: "flyDownAnimation")
        self.flapping = false
    }
    
    func onTap() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
