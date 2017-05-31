//
//  ViewController.swift
//  Kana Trainer
//
//  Created by Lisa on 5/22/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController, gameOverDelegate {
    
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var gameScoreLabel: UILabel!
    
    var hiragana : Bool = true
    var gameOver : Bool = false
    var gamePoints : Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func menuButtonPressed(_ sender: AnyObject) {
        switch sender.tag {
        case 1:
            // hiragan button
            customSegue(isHiragana: true)
            break
        case 2:
            // katakana button
            customSegue(isHiragana: false)
            break
        case 3:
            // how to play button
            print("How to play button")
            break
        default:
            break
        }
    }
    
    func configureUI() {
        if gameOver {
            gameOverLabel.text = "Game Over"
            gameScoreLabel.text = "Your score: " + String(gamePoints)
        } else {
            gameOverLabel.text = ""
            gameScoreLabel.text = ""
        }
    }
    
    func gameOverScreen(score: Int) {
        gameOver = true
        gamePoints = score
        
        configureUI()
    }
    
    
    func customSegue(isHiragana: Bool) {
        hiragana = isHiragana
        performSegue(withIdentifier: "showKana", sender: self)
        if isHiragana {
            print("Hiragana Button Pressed")
        } else {
            print("Katakana Button Pressed")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let destination = segue.destination as! KanaViewController
        destination.hiragana = self.hiragana
        destination.delegate = self
    }

}

