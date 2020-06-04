//
//  ViewController.swift
//  Switcher
//
//  Created by Alexander on 10/11/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var onOffLabel: UILabel!
    
    var switchStatus: SwitchStatus = .off
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func powerButton(_ sender: UIButton) {
        switchStatus.toggle()
        if switchStatus == .off {
            updateUI(labelText: "OFF", backgroundColor: .darkGray)
        } else {
            onOffLabel.text = "ON"
            updateUI(labelText: "ON", backgroundColor: .lightGray)
        }
    }
    
    func updateUI(labelText text: String, backgroundColor color: UIColor) {
        onOffLabel.text = text
        view.backgroundColor = color
    }
    
}

