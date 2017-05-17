
import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / \(allQuestions.list.count)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        if questionNumber <= 12 {
            
            questionLabel.text = allQuestions.list[questionNumber].question
            updateUI()
            
        } else {
            let alert = UIAlertController(
                title: "GAME OVER",
                message: "That was all folks",
                preferredStyle: .alert
            )
            
            let restartAction = UIAlertAction(
                title: "Play again",
                style: .default,
                handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if pickedAnswer == correctAnswer {
            score += 1
            print("You got it right")
        } else {
            print("You go it wrong")
        }
        
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    
}
