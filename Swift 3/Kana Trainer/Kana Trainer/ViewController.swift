//
//  ViewController.swift
//  Kana Trainer
//
//  Created by Lisa on 5/22/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hiragana : Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
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
    }

}

