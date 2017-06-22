//
//  EcounterManager.swift
//  Pierre Game
//
//  Created by Lisa on 6/20/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit

class EncounterManager {
    
    let encounterNames: [String] = [
        "EncounterA",
        "EncounterB",
        "EncounterC"
    ]
    
    var currentEncounterIndex: Int?
    var previousEncounterIndex: Int?
    
    var encounters: [SKNode] = []
    
    init() {
        for encounterFileName in encounterNames {
            let encounterNode = SKNode()
            if let encounterScene = SKScene(fileNamed: encounterFileName) {
                for child in encounterScene.children {
                    let copyOfNode = type(of: child).init()
                    copyOfNode.position = child.position
                    copyOfNode.name = child.name
                    encounterNode.addChild(copyOfNode)
                }
            }
            encounters.append(encounterNode)
            saveSpritePosition(node: encounterNode)
        }
    }
        
    func addEncountersToScene(gameScene: SKNode) {
        var encounterPosY = 1000
        for encounterNode in encounters {
            encounterNode.position = CGPoint(x: -2000, y: encounterPosY)
            gameScene.addChild(encounterNode)
            encounterPosY *= 2
        }
    }
    
    func saveSpritePosition(node: SKNode) {
        for sprite in node.children {
            guard let spriteNode = sprite as? SKSpriteNode else { return }
            let initialPositionValue = NSValue.init(cgPoint: sprite.position)
            spriteNode.userData = ["initialPosition": initialPositionValue]
            saveSpritePosition(node: spriteNode)
        }
    }
    
    func resetSpritePosition(node: SKNode) {
        for sprite in node.children {
            guard let spriteNode = sprite as? SKSpriteNode else { return }
            spriteNode.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            spriteNode.physicsBody?.angularVelocity = 0
            spriteNode.zRotation = 0
            if let initalPositionValue = spriteNode.userData?.value(forKey: "initialPosition") as? NSValue {
                spriteNode.position = initalPositionValue.cgPointValue
            }
            resetSpritePosition(node: spriteNode)
        }
    }
    
    func placeNextEncounter(currentXPos: CGFloat) {
        let encounterCount = UInt32(encounters.count)
        guard encounterCount > 2 else { return }
        var nextEncounterIndex: Int?
        var truylNew: Bool?
        
        while truylNew == false || truylNew == nil {
            nextEncounterIndex = Int(arc4random_uniform(encounterCount))
            truylNew = true
            
            if let currentIndex = currentEncounterIndex {
                if nextEncounterIndex == currentIndex {
                    truylNew = false
                }
            }
            
            if let previousIndex = previousEncounterIndex {
                if nextEncounterIndex == previousIndex {
                    truylNew = false
                }
            }
        }
        
        previousEncounterIndex = currentEncounterIndex
        currentEncounterIndex = nextEncounterIndex
        
        let encounter = encounters[currentEncounterIndex!]
        encounter.position = CGPoint(x: currentXPos + 1000, y: 300)
        resetSpritePosition(node: encounter)
    }
    
}
