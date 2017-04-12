//
//  KatakanaViewController.swift
//  KanaFighter2
//
//  Created by Lisa on 1/5/16.
//  Copyright © 2016 Sascha Alexander. All rights reserved.
//

import UIKit
import iAd

class KatakanaViewController: UIViewController, ADBannerViewDelegate {
    
    //MARK: Action and Outlet
    @IBOutlet weak var adBanner: ADBannerView!
    @IBOutlet weak var textDisplay: UILabel!
    
    @IBOutlet weak var buttonTextOne: UIButton!
    @IBOutlet weak var buttonTextTwo: UIButton!
    @IBOutlet weak var buttonTextThree: UIButton!
    @IBOutlet weak var buttonTextFour: UIButton!
    
    @IBOutlet weak var displayPoints: UILabel!
    @IBOutlet weak var displayLives: UILabel!
    
    
    @IBAction func buttonOne(_ sender: UIButton) {
        
        if checkTrueAnswer(someRandomNumber[0]) == true {
            continueGame(true)
        } else {
            continueGame(false)
            
            guard didPlayerLose(totalLives) == false
                else {
                    return self.performSegue(withIdentifier: "GameoverK", sender: nil)
            }
        }
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        if checkTrueAnswer(someRandomNumber[1]) == true {
            continueGame(true)
        } else {
            continueGame(false)
            
            guard didPlayerLose(totalLives) == false
                else {
                    return self.performSegue(withIdentifier: "GameoverK", sender: nil)
            }
        }
    }
    
    @IBAction func buttonThree(_ sender: UIButton) {
        if checkTrueAnswer(someRandomNumber[2]) == true {
            continueGame(true)
        } else {
            continueGame(false)
            
            guard didPlayerLose(totalLives) == false
                else {
                    return self.performSegue(withIdentifier: "GameoverK", sender: nil)
            }
        }
    }
    
    @IBAction func buttonFour(_ sender: UIButton) {        
        if checkTrueAnswer(someRandomNumber[3]) == true {
            continueGame(true)
        } else {
            continueGame(false)
            
            guard didPlayerLose(totalLives) == false
                else {
                    return self.performSegue(withIdentifier: "GameoverK", sender: nil)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMyRandomNumbers()
        setMyDisplayText(someRandomNumber)
        setMyButtonText(someRandomNumber)
        
        displayPoints.text = "\(totalPoints)"
        displayLives.text = "\(totalLives)"
        
        self.canDisplayBannerAds = true
        self.adBanner?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: Segue Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameOver : GameOverViewController = segue.destination as! GameOverViewController
        
        gameOver.getPoints = totalPoints
    }
    
    
    //MARK: Variables
    var someRandomNumber : [Int] = []
    var totalPoints : Int = 0
    var totalLives : Int = 3
    
    let katakanaRomaji : [String] = ["KA", "KI", "KU", "KE", "KO", "SA", "SHI", "SU", "SE", "SO", "TA", "CHI", "TSU", "TE", "TO"]
    let katakanaNormal : [String] = ["カ", "キ", "ク", "ケ", "コ", "サ", "シ", "ス", "セ", "ソ", "タ", "チ", "ツ", "テ", "ト"]

    
    //MARK: Game Functions
    func getMyRandomNumbers() {
        while someRandomNumber.count < 5 {
            let rand = Int(arc4random_uniform(UInt32(9)))
            if someRandomNumber.contains(rand) {
                print("Do nothing")
            } else {
                someRandomNumber.append(rand)
                print(rand)
            }
        }
    }
    
    func setMyButtonText(_ integerArray : [Int]) {
        buttonTextOne.setTitle("\(katakanaRomaji[integerArray[0]])", for: UIControlState())
        buttonTextTwo.setTitle("\(katakanaRomaji[integerArray[1]])", for: UIControlState())
        buttonTextThree.setTitle("\(katakanaRomaji[integerArray[2]])", for: UIControlState())
        buttonTextFour.setTitle("\(katakanaRomaji[integerArray[3]])", for: UIControlState())
    }
    
    
    func setMyDisplayText(_ integerArray : [Int]) {
        let rand = Int(arc4random_uniform(UInt32(4)))
        textDisplay.text = katakanaNormal[integerArray[rand]]
    }
    
    
    func checkTrueAnswer(_ integer : Int) -> Bool {
        if textDisplay.text == katakanaNormal[integer] {
            return true
        } else {
            return false
        }
    }
    
    
    func didPlayerLose(_ lives : Int) -> Bool {
        if lives == 0 {
            return true
        } else {
            return false
        }
    }
    
    
    func continueGame(_ yesOrNo : Bool) {
        if yesOrNo == true {
            someRandomNumber.removeAll()
            
            getMyRandomNumbers()
            setMyDisplayText(someRandomNumber)
            setMyButtonText(someRandomNumber)
            
            totalPoints += 1
            
            displayPoints.text = "\(totalPoints)"
            
        } else {
            someRandomNumber.removeAll()
            
            getMyRandomNumbers()
            setMyDisplayText(someRandomNumber)
            setMyButtonText(someRandomNumber)
            
            totalPoints -= 1
            totalLives -= 1
            
            displayPoints.text = "\(totalPoints)"
            displayLives.text = "\(totalLives)"
        }
    }
    
    
    //MARK: AdBanner
    func bannerViewDidLoadAd(_ banner: ADBannerView!) {
    }
    
    func bannerViewWillLoadAd(_ banner: ADBannerView!) {
    }
    
    func bannerViewActionShouldBegin(_ banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerViewActionDidFinish(_ banner: ADBannerView!) {
    }
    
    func bannerView(_ banner: ADBannerView!, didFailToReceiveAdWithError error: Error!) {
    }
}
