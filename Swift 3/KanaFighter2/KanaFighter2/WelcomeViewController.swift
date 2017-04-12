//
//  WelcomeViewController.swift
//  KanaFighter2
//
//  Created by Lisa on 1/5/16.
//  Copyright © 2016 Sascha Alexander. All rights reserved.
//

import UIKit
import iAd
import Social

class WelcomeViewController: UIViewController, ADBannerViewDelegate {
    
    //MARK: Action & Outlet
    @IBAction func facebookButton(_ sender: UIButton) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            let facebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebook?.setInitialText(NSLocalizedString("SOCIAL_DEFAULT", comment: "default"))
            self.present(facebook!, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Account", message: "Please log into your Facebook account", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func twitterButton(_ sender: UIButton) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            let twitter = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitter?.setInitialText(NSLocalizedString("SOCIAL_DEFAULT", comment: "default"))
            self.present(twitter!, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Account", message: "Please log into your Twitter account", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
            self.present(alert , animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var adBanner: ADBannerView!
    
    @IBOutlet weak var shareText: UILabel!
    
    @IBOutlet weak var howToPlay: UIButton!
    
    
    //MARK: Init functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shareText.text = NSLocalizedString("SHARE_FRRIENDS", comment: "Share")
        
        howToPlay.setTitle(NSLocalizedString("HOW_TO", comment: "How to"), for: UIControlState())
        
        self.canDisplayBannerAds = true
        self.adBanner?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: AdBanner
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
