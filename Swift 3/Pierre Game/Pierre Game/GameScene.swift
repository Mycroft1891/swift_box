//
//  GameScene.swift
//  Pierre Game
//
//  Created by Lisa on 6/14/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let cam = SKCameraNode()
    let ground = Ground()
    let player = Player()
    let initialPlayerPosition = CGPoint(x: 150, y: 250)
    let encounterManager = EncounterManager()
    let powerUpStar = Star()

    var screenCenterY = CGFloat()
    var playerProgress = CGFloat()
    var nextEncounterSpawnPosition = CGFloat(150)
    
    override func didMove(to view: SKView) {
        self.anchorPoint = .zero
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        self.camera = cam
        
        ground.position = CGPoint(x: -self.size.width * 2, y: 30)
        ground.size = CGSize(width: self.size.width * 6, height: 0)
        ground.createChildren()
        self.addChild(ground)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        screenCenterY = self.size.height / 2
        
        player.position = initialPlayerPosition
        self.addChild(player)
        
        powerUpStar.position = CGPoint(x: -2000, y: -2000)
        self.addChild(powerUpStar)
        
        encounterManager.addEncountersToScene(gameScene: self)
        encounterManager.encounters[0].position = CGPoint(x: 400, y: 330)
    }
    
    override func didSimulatePhysics() {
        var cameraYPosition = screenCenterY
        cam.yScale = 1
        cam.xScale = 1
        
        if (player.position.y > screenCenterY) {
            cameraYPosition = player.position.y
            let percentOfMaxHeight = (player.position.y - screenCenterY) / (player.maxHeight - screenCenterY)
            let newScale = 1 + percentOfMaxHeight
            cam.yScale = newScale
            cam.xScale = newScale
        }
        
        self.camera!.position = CGPoint(x: player.position.x, y: cameraYPosition)
        playerProgress = player.position.x - initialPlayerPosition.x
        ground.checkForReposition(playerProgress: playerProgress)
        
        if player.position.x > nextEncounterSpawnPosition {
            encounterManager.placeNextEncounter(currentXPos: nextEncounterSpawnPosition)
            nextEncounterSpawnPosition += 1200
            
            let starRoll = Int(arc4random_uniform(10))
            if starRoll == 0 {
                if abs(player.position.x - powerUpStar.position.x) > 1200 {
                    let randomYPos = 50 + CGFloat(arc4random_uniform(400))
                    powerUpStar.position = CGPoint(x: nextEncounterSpawnPosition, y: randomYPos)
                    powerUpStar.physicsBody?.angularVelocity = 0
                    powerUpStar.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        player.update()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let nodeTouched = atPoint(location)
            if let gameSprite = nodeTouched as? GameSprite {
                gameSprite.onTap()
            }
        }
    
        player.startFlapping()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.stopFlapping()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.stopFlapping()
    }
    
}
