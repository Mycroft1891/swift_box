//
//  MainMenu.swift
//  Test Game
//
//  Created by Lisa on 5/21/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let game : GameScene = GameScene(fileNamed: "GameScene") {
            game.scaleMode = .aspectFill
            let transition : SKTransition = SKTransition.crossFade(withDuration: 1)
            self.view?.presentScene(game, transition: transition)
        }
    }
}
