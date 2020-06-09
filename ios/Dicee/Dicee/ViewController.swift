import UIKit

class ViewController: UIViewController {
    
    let diceImages = [#imageLiteral(resourceName: "Dice1"), #imageLiteral(resourceName: "Dice2"), #imageLiteral(resourceName: "Dice3"), #imageLiteral(resourceName: "Dice4"), #imageLiteral(resourceName: "Dice5"), #imageLiteral(resourceName: "Dice6")]

    @IBOutlet weak var diceImage1: UIImageView!
    
    @IBOutlet weak var diceImage2: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        randomlySetDiceImages()
    }
    
    func randomlySetDiceImages() {
        diceImage1.image = diceImages[Int.random(in: 0...5)]
        diceImage2.image = diceImages[Int.random(in: 0...5)]
    }
    
}

