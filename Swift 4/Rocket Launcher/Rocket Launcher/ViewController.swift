//
//  ViewController.swift
//  Rocket Launcher
//
//  Created by Alexander on 10/3/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // outlets and actions
    @IBOutlet weak var darBlueBG: UIImageView!
    @IBOutlet weak var powerLabel: UIButton!
    @IBOutlet weak var cloudView: UIView!
    @IBOutlet weak var rocketImage: UIImageView!
    
    @IBAction func powerButton(_ sender: Any) {
        powerLabel.isHidden = true
        darBlueBG.isHidden = true
        cloudView.isHidden = false
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocketImage.frame = CGRect(x: 0, y: 160, width: 414, height: 402)
        }) { (finished) in
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

