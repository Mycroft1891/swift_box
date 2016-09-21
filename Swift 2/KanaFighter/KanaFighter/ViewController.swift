//
//  ViewController.swift
//  KanaFighter
//
//  Created by Lisa on 1/4/16.
//  Copyright © 2016 Sascha Alexander. All rights reserved.
//

import UIKit
import iAd
import Foundation

class ViewController: UIViewController, ADBannerViewDelegate {
    
    //MARK: Action and Outlet
    
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var pointText: UILabel!
    
    @IBOutlet weak var buttonOneT: UIButton!
    @IBOutlet weak var buttonTwoT: UIButton!
    @IBOutlet weak var buttonThreeT: UIButton!
    @IBOutlet weak var buttonFourT: UIButton!
    
    @IBAction func buttonOne(sender: UIButton) {
    }
    
    @IBAction func buttonTwo(sender: UIButton) {
    }

    @IBAction func buttonThree(sender: UIButton) {
    }
    
    @IBAction func buttonFour(sender: UIButton) {
    }
    
    @IBAction func twitterButton(sender: UIButton) {
    }
    
    @IBAction func facebookButton(sender: UIButton) {
    }
    
    @IBOutlet weak var adBanner: ADBannerView!
    
    //MARK: Variables
    
    let hiraganaR : [String] = ["KA", "KI", "KU", "KE", "KO", "SA", "SHI", "SU", "SE", "SO"]
    let hiragana : [String] = ["か", "き", "く", "け", "こ", "さ", "し", "す", "か", "せ"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rOne = someRandomNumber[0]
        let rTwo = someRandomNumber[1]
        let rThree = someRandomNumber[2]
        let rFour = someRandomNumber[3]
        
        self.canDisplayBannerAds = true
        self.adBanner?.delegate = self
        
        getMyRandomNumbers()
        
        let randomIndex = Int(arc4random_uniform(UInt32(4)))
        
        displayText.text = hiragana[someRandomNumber[randomIndex]]
        pointText.text =  "\(someRandomNumber[randomIndex])"
        
        buttonOneT.setTitle(hiraganaR[rOne], forState: .Normal)
        buttonTwoT.setTitle(hiraganaR[rTwo], forState: .Normal)
        buttonThreeT.setTitle(hiraganaR[rThree], forState: .Normal)
        buttonFourT.setTitle(hiraganaR[rFour], forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: Functions
    
    //var anyRandomNumber : [Int] = []
    
    var someRandomNumber : [Int] = []
    
    func getMyRandomNumbers() {
        while someRandomNumber.count < 5 {
            let rand = Int(arc4random_uniform(UInt32(9)))
            if someRandomNumber.contains(rand) {
                print("Do nothing")
            } else {
                someRandomNumber.append(rand)
            }
        }
    }
    
    
    //MARK: Adbanner
    
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

