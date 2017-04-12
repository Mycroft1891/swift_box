//
//  HowToViewController.swift
//  KanaFighter2
//
//  Created by Lisa on 1/5/16.
//  Copyright © 2016 Sascha Alexander. All rights reserved.
//

import UIKit
import iAd

class HowToViewController: UIViewController, ADBannerViewDelegate {
    
    //MARK: Action & Outlet
    @IBOutlet weak var howText: UITextView!
    
    @IBOutlet weak var adBanner: ADBannerView!
    

    //MARK: Init functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.canDisplayBannerAds = true
        self.adBanner?.delegate = self
        
        // set up localizable strings
        howText.text = NSLocalizedString("GAME_DESCRIPTION", comment: "Game Description")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Adbanner
    func bannerViewWillLoadAd(_ banner: ADBannerView!) {
    }
    
    func bannerViewDidLoadAd(_ banner: ADBannerView!) {
    }
    
    func bannerViewActionShouldBegin(_ banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerViewActionDidFinish(_ banner: ADBannerView!) {
    }
    
    func bannerView(_ banner: ADBannerView!, didFailToReceiveAdWithError error: Error!) {
    }
}
