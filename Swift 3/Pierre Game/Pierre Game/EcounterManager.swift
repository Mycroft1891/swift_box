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
        "EncounterA"
    ]
    
    var encounters: [SKNode] = []
    
    init() {
        for encounterFileName in encounterNames {
            let encounterNode = SKNode()
            print(encounterFileName)
            if let encounterScene = SKScene(fileNamed: encounterFileName) {
                print("looping children")
                for child in encounterScene.children {
                    print("Init children")
                    let copyOfNode = type(of: child).init()
                    copyOfNode.position = child.position
                    copyOfNode.name = child.name
                    encounterNode.addChild(copyOfNode)
                }
            }
            encounters.append(encounterNode)
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
}
