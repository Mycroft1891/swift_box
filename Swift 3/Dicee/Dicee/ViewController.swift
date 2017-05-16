import UIKit

class ViewController: UIViewController {
    
    var random1: Int = 0
    var random2: Int = 0
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]

    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandomDiceFaces()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        setRandomDiceFaces()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        setRandomDiceFaces()
    }
    
    // generate random dice faces
    func setRandomDiceFaces() {
        random1 = Int(arc4random_uniform(6))
        random2 = Int(arc4random_uniform(6))
        
        dice1.image = UIImage(named: diceArray[random1])
        dice2.image = UIImage(named: diceArray[random2])
    }
}

