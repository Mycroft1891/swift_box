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
    @IBAction func facebookButton(sender: UIButton) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let facebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebook.setInitialText(NSLocalizedString("SOCIAL_DEFAULT", comment: "default"))
            self.presentViewController(facebook, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Account", message: "Please log into your Facebook account", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func twitterButton(sender: UIButton) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let twitter = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitter.setInitialText(NSLocalizedString("SOCIAL_DEFAULT", comment: "default"))
            self.presentViewController(twitter, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Account", message: "Please log into your Twitter account", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default , handler: nil))
            self.presentViewController(alert , animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var adBanner: ADBannerView!
    
    @IBOutlet weak var shareText: UILabel!
    
    @IBOutlet weak var howToPlay: UIButton!
    
    
    //MARK: Init functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shareText.text = NSLocalizedString("SHARE_FRRIENDS", comment: "Share")
        
        howToPlay.setTitle(NSLocalizedString("HOW_TO", comment: "How to"), forState: .Normal)
        
        self.canDisplayBannerAds = true
        self.adBanner?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: AdBanner
    func bannerViewWillLoadAd(banner: ADBannerView!) {
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
    }

}
