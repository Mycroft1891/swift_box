//
//  KanaViewController.swift
//  Kana Trainer
//
//  Created by Lisa on 5/22/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import UIKit

protocol gameOverDelegate {
    func gameOverScreen(score: Int)
}

class KanaViewController: UIViewController {
    
    var delegate: gameOverDelegate?
    
    var hiragana : Bool = true
    var answerIndex : Int = 0
    var questionArray: [Int] = []
    
    var lifeArray = ["♥️","♥️","♥️","♥️","♥️"]
    var score : Int = 0
    
    @IBOutlet weak var questionDisplay: UILabel!
    @IBOutlet weak var liveLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
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
        
        kana = hiragana ? hiraganaArray : katakanaArray
        pickRandomQuestionAndAnswer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func answerButtonPressed(_ sender: AnyObject) {
        
        switch sender.tag {
        case 1:
            checkAnswer(buttonIndex: 0)
            break
        case 2:
            checkAnswer(buttonIndex: 1)
            break
        case 3:
            checkAnswer(buttonIndex: 2)
            break
        case 4:
            checkAnswer(buttonIndex: 3)
        default:
            break
        }
    }
    
    func pickRandomQuestionAndAnswer() {
        while questionArray.count < 4 {
            let randomNumber = arc4random_uniform(UInt32(kana.count))
            if !questionArray.contains(Int(randomNumber)) {
                questionArray.append(Int(randomNumber))
            }
        }
        print(questionArray)
        let randomAnswer = Int(arc4random_uniform(UInt32(questionArray.count)))
        answerIndex = questionArray[randomAnswer]
        configureUI()
    }
    
    func configureUI() {
        
        let first   = kana[questionArray[0]]
        let second  = kana[questionArray[1]]
        let third   = kana[questionArray[2]]
        let fourth  = kana[questionArray[3]]
        
        choice1.setTitle(first, for: .normal)
        choice2.setTitle(second, for: .normal)
        choice3.setTitle(third, for: .normal)
        choice4.setTitle(fourth, for: .normal)
        
        questionDisplay.text = romanjiArray[answerIndex]
        scoreLabel.text = "Score: " + String(score)
        liveLabel.text = lifeArray.joined(separator: "")
    }
    
    func checkAnswer(buttonIndex: Int) {
        print("Answer: \(answerIndex) | Question: \(questionArray[buttonIndex])")
        if answerIndex == questionArray[buttonIndex] {
            score += 1
        } else {
            lifeArray.popLast()
        }
        
        questionArray = []
        pickRandomQuestionAndAnswer()
        
        if lifeArray.count <= 0 {
            print("GAME OVER")
            delegate?.gameOverScreen(score: score)
            self.dismiss(animated: true, completion: nil)
        }
    
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
