//
//  Channe;ViewController.swift
//  slack-clone
//
//  Created by Alexander on 10/30/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 60
    }

}
