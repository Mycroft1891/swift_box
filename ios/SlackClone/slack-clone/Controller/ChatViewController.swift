//
//  ChatViewController.swift
//  slack-clone
//
//  Created by Alexander on 10/30/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    // MARK: IBOutlets and Variables
    @IBOutlet weak var menuButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
    
    // MARK: IBActions and Functions
}
