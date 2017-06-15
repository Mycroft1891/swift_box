//
//  GameViewController.swift
//  Pierre Game
//
//  Created by Lisa on 6/14/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        guard let view = self.view as! SKView? else { return }
        guard let scene = SKScene(fileNamed: "GameScene") else { return }
        
        scene.scaleMode = .aspectFill
        scene.size = view.bounds.size
        view.presentScene(scene)
        
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
                return .landscape
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
