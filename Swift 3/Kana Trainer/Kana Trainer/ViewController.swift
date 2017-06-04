//
//  ViewController.swift
//  Kana Trainer
//
//  Created by Lisa on 5/22/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import UIKit
import Social

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
        // 1 = hiragana | 2 = katakan | 3 = how to play
        switch sender.tag {
            case 1:
                customSegue(isHiragana: true)
            case 2:
                customSegue(isHiragana: false)
            case 3:
                performSegue(withIdentifier: "showRules", sender: self)
            default:
                break
        }
    }
    
    @IBAction func shareButtonPressed(_ sender: AnyObject) {
        let social : Bool = sender.tag == 5 ? true : false
        shareAction(isTwitter: social)
    }
    
    func configureUI() {
        gameOverLabel.text  = gameOver ? "Game Over" : ""
        gameScoreLabel.text = gameOver ? "Your score: \(gamePoints)" : ""
    }
    
    func gameOverScreen(score: Int) {
        gameOver = true
        gamePoints = score
        configureUI()
    }
    
    func shareAction(isTwitter: Bool) {
        
        let socialMedia: String = isTwitter ? "Twitter" : "Facebook"
        let service: String = isTwitter ? SLServiceTypeTwitter : SLServiceTypeFacebook
        
        let alert = UIAlertController(
                title: "Share on \(socialMedia)",
                message: "Share my awesome score" ,
                preferredStyle: .actionSheet)
        
        let action = UIAlertAction(title: "Share on \(socialMedia)", style: .default) { action in
            let slcPost = SLComposeViewController(forServiceType: service)
            guard let post = slcPost else { return }
                post.setInitialText("I scored \(self.gamePoints) on Kana Fighter.")
                self.present(post, animated: true, completion: nil)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func customSegue(isHiragana: Bool) {
        hiragana = isHiragana
        performSegue(withIdentifier: "showKana", sender: self)
        let kanaText = isHiragana ? "Hiragana" : "Katakana"
        print("\(kanaText) Button Pressed")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showKana" else { print("How to Play"); return }
            let destination = segue.destination as! KanaViewController
            destination.hiragana = self.hiragana
            destination.delegate = self
    }

}

