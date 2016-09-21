//
//  ViewController.swift
//  KanaFighter2
//
//  Created by Lisa on 1/5/16.
//  Copyright © 2016 Sascha Alexander. All rights reserved.
//

import UIKit
import iAd

class HiraganaViewController: UIViewController, ADBannerViewDelegate {
    
    //MARK: Action and Outlet
    @IBOutlet weak var adBanner: ADBannerView!
    @IBOutlet weak var textDisplay: UILabel!
    
    @IBOutlet weak var buttonTextOne: UIButton!
    @IBOutlet weak var buttonTextTwo: UIButton!
    @IBOutlet weak var buttonTextThree: UIButton!
    @IBOutlet weak var buttonTextFour: UIButton!
    
    @IBOutlet weak var displayPoints: UILabel!
    @IBOutlet weak var displayLives: UILabel!
    
    
    @IBAction func buttonOne(sender: UIButton) {
        
        if checkTrueAnswer(someRandomNumber[0]) == true {
            continueGame(true)
        } else {
            continueGame(false)
            
            guard didPlayerLose(totalLives) == false
                else {
                    return self.performSegueWithIdentifier("GameoverH", sender: nil)
            }
        } 
    }
    
    @IBAction func buttonTwo(sender: UIButton) {
        
        if checkTrueAnswer(someRandomNumber[1]) == true {
            continueGame(true)
        } else {
            continueGame(false)
            
            guard didPlayerLose(totalLives) == false
                else {
                    return self.performSegueWithIdentifier("GameoverH", sender: nil)
            }
        }
    }

    @IBAction func buttonThree(sender: UIButton) {
        
        if checkTrueAnswer(someRandomNumber[2]) == true {
            continueGame(true)
        } else {
            continueGame(false)
            
            guard didPlayerLose(totalLives) == false
                else {
                    return self.performSegueWithIdentifier("GameoverH", sender: nil)
            }
        }
    }
    
    @IBAction func buttonFour(sender: UIButton) {
        
        if checkTrueAnswer(someRandomNumber[3]) == true {
            continueGame(true)
        } else {
            continueGame(false)
            
            guard didPlayerLose(totalLives) == false
                else {
                    return self.performSegueWithIdentifier("GameoverH", sender: nil)
            }
        }
    }
    
    
    //MARK: Default Functions
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let gameOver : GameOverViewController = segue.destinationViewController as! GameOverViewController
        
        gameOver.getPoints = totalPoints
    }
    
    
    //MARK: Variables
    var someRandomNumber : [Int] = []
    var totalPoints : Int = 0
    var totalLives : Int = 3
    
    let hiraganaR : [String] = ["KA", "KI", "KU", "KE", "KO", "SA", "SHI", "SU", "SE", "SO", "TA", "CHI", "TSU", "TE", "TO"]
    let hiragana : [String] = ["か", "き", "く", "け", "こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と"]
    
    
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
    
    func setMyButtonText(integerArray : [Int]) {
        buttonTextOne.setTitle("\(hiraganaR[integerArray[0]])", forState: .Normal)
        buttonTextTwo.setTitle("\(hiraganaR[integerArray[1]])", forState: .Normal)
        buttonTextThree.setTitle("\(hiraganaR[integerArray[2]])", forState: .Normal)
        buttonTextFour.setTitle("\(hiraganaR[integerArray[3]])", forState: .Normal)
    }
    
    
    func setMyDisplayText(integerArray : [Int]) {
        let rand = Int(arc4random_uniform(UInt32(4)))
        textDisplay.text = hiragana[integerArray[rand]]
    }
    
    
    func checkTrueAnswer(integer : Int) -> Bool {
        if textDisplay.text == hiragana[integer] {
            return true
        } else {
            return false
        }
    }
    
    
    func didPlayerLose(lives : Int) -> Bool {
        if lives == 0 {
            return true
        } else {
            return false
        }
    }
    
    
    func continueGame(yesOrNo : Bool) {
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
    func bannerViewDidLoadAd(banner: ADBannerView!) {
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
    }
}

