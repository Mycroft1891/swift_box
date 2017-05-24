//
//  KanaViewController.swift
//  Kana Trainer
//
//  Created by Lisa on 5/22/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import UIKit

class KanaViewController: UIViewController {
    
    var hiragana : Bool = true
    
    var answerIndex : Int = 0
    
    let romanjiArray : [String] = [
        "KA", "KI", "KU", "KE", "KO",
        "SA", "SHI", "SU", "SE", "SO",
        "TA", "CHI", "TSU", "TE", "TO"
    ]
    
    let hiraganaArray : [String] = [
        "か", "き", "く", "け", "こ",
        "さ", "し", "す", "せ", "そ",
        "た", "ち", "つ", "て", "と"
    ]
    
    let katakanaArray : [String] = [
        "カ", "キ", "ク", "ケ", "コ",
        "サ", "シ", "ス", "セ", "ソ",
        "タ", "チ", "ツ", "テ", "ト"
    ]
    
    var kana : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if hiragana {
            kana = hiraganaArray
        } else {
            kana = katakanaArray
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func returnButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
