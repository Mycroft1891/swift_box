//
//  LeagueViewController.swift
//  Soccer League
//
//  Created by Alexander on 10/22/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class LeagueViewController: UIViewController {
    
    // MARK: IBOutlets & variables
    @IBOutlet weak var nextButton: BorderButton!
    
    var player: Player!
    
    // MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: IBActions
    @IBAction func nextButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showSkillViewController", sender: self)
    }
    
    @IBAction func onSelectPressed(_ sender: UIButton) {
        // 1: mens, 2: womens, 3: coed
        selectLeague(number: sender.tag - 1)
    }
    
    func selectLeague(number: Int) {
        var options = ["Mens", "Womens", "Coed"]
        player.league = options[number]
        nextButton.isEnabled = true
    }
    
}
