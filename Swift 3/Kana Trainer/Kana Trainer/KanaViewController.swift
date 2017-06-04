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
    
    var hiragana    : Bool  = true
    var answerIndex : Int   = 0
    var questions   : [Int] = []
    var seconds     : Int   = 60
    var timer       : Timer = Timer()
    
    var lifeArray = ["♥️","♥️","♥️","♥️","♥️"]
    var score : Int = 0
    
    @IBOutlet var choiceArray: [UIButton]!
    @IBOutlet weak var questionDisplay: UILabel!
    @IBOutlet weak var liveLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeCounter: UILabel!
    
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
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.timerLogic()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func answerButtonPressed(_ sender: AnyObject) {
        checkAnswer(buttonIndex: sender.tag - 1)
    }
    
    
    func checkAnswer(buttonIndex: Int) {
        print("Answer: \(answerIndex) | Question: \(questions[buttonIndex])")
        if answerIndex == questions[buttonIndex] {
            score += 1
            seconds += 2
        } else {
            lifeArray.removeLast()
        }
        
        questions = []
        pickRandomQuestionAndAnswer()
        
        lifeArray.count <= 0 ? gameOver() : print("nothing")
    }
    
    
    func pickRandomQuestionAndAnswer() {
        while questions.count < 4 {
            let randomNumber : Int = Int(arc4random_uniform(UInt32(kana.count)))
            if !questions.contains(randomNumber) {
                questions.append(randomNumber)
            }
        }
        print(questions)
        let randomAnswer = Int(arc4random_uniform(UInt32(questions.count)))
        answerIndex = questions[randomAnswer]
        configureUI()
    }
    
    
    func configureUI() {
        
        for (index, choice) in questions.enumerated() {
            choiceArray[index].setTitle(kana[choice], for: .normal)
        }
        questionDisplay.text = romanjiArray[answerIndex]
        scoreLabel.text = "Score: " + String(score)
        liveLabel.text = lifeArray.joined(separator: "")
    }
    
    func gameOver() {
        print("GAME OVER")
        delegate?.gameOverScreen(score: score)
        self.dismiss(animated: true, completion: nil)
        timer.invalidate()
    }
    
    func timerLogic() {
        if seconds > 0 {
            timeCounter.text = String(seconds)
            seconds -= 1
        } else {
            gameOver()
        }
    }
    
}
