//
//  RulesViewController.swift
//  Kana Trainer
//
//  Created by Lisa on 5/31/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {
    
    let rulesText: [String] = [
        "Welcome to Kana Fighter\nTo get started, choose a play mode between Hiragana or Katakana",
        "On the top left, you can see how many lives you have (♥️♥️♥️♥️♥️). You start with 5 but every wrong answer takes 1 away.\n",
        "On the top right, you can see how many points you scored so far for the fun",
        "In orange a Japanese syllable is prompted and you have to find its meaning among the provided choices"
    ]
    
    @IBOutlet weak var rulesPrompt: UITextView!
    @IBOutlet weak var paginationControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        setText(forPage: 0)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func returnMenuPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
        
    func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            print("Swipe Right")
            guard paginationControl.currentPage > 0 else {
                return
            }
            paginationControl.currentPage -= 1
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.left {
            print("Swipe Left")
            guard paginationControl.currentPage < paginationControl.numberOfPages - 1 else {
                return
            }
            paginationControl.currentPage += 1
        }
        
        setText(forPage: paginationControl.currentPage)
    }
    
    func setText(forPage: Int) {
        rulesPrompt.text = rulesText[forPage]
    }
    
    
}
