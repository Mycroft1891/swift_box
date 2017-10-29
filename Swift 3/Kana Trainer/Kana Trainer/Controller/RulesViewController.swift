//
//  RulesViewController.swift
//  Kana Trainer
//
//  Created by Lisa on 5/31/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {
    
    // MARK: IBOutlets & Variables
    let rulesText: [String] = [
        "Welcome to Kana Fighter\nTo get started, choose a play mode between Hiragana or Katakana",
        "On the top left, you can see how many lives you have (♥️♥️♥️♥️♥️). You start with 5 but every wrong answer takes 1 away.",
        "On the top right, you can see how many points you scored so far for the fun",
        "In orange a Japanese syllable is prompted and you have to find its meaning among the provided choices"
    ]
    
    @IBOutlet weak var rulesPrompt: UITextView!
    @IBOutlet weak var pageView: UIPageControl!
    
    // MARK: ViewController Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        rulesPrompt.text = rulesText[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: IBActions & Functions
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        print("Swiped Right")
        userSwiped(left: false)
    }
    
    @IBAction func leftSwipe(_ sender: UIGestureRecognizer) {
        print("Swiped Left")
        userSwiped(left: true)
    }
    
    @IBAction func returnMenuPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func userSwiped(left: Bool) {
        guard pageView.currentPage < pageView.numberOfPages - 1 || pageView.currentPage > 0 else { return }
            pageView.currentPage = left ? pageView.currentPage + 1 : pageView.currentPage - 1
            rulesPrompt.text = rulesText[pageView.currentPage]
    }
}
