//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Lisa on 5/16/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]

    @IBOutlet weak var ball: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandomBall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        setRandomBall()
    }
    
    func setRandomBall() {
        let randomIndex = Int(arc4random_uniform(5))
        ball.image = UIImage(named: ballArray[randomIndex])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        setRandomBall()
    }

}

