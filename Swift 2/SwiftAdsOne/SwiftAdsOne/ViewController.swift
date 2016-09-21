//
//  ViewController.swift
//  SwiftAdsOne
//
//  Created by Lisa on 1/2/16.
//  Copyright © 2016 Sascha Alexander. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate, ADInterstitialAdDelegate {
    
    
    //MARK: Variable decleration
    
    var fullAd = ADInterstitialAd()
    var dummyView : UIView!
    var closeButton : UIButton!
    
    //MARK: Action and Output
    
    @IBOutlet var adBannerView: ADBannerView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.canDisplayBannerAds = true
        self.adBannerView?.delegate = self
        self.adBannerView?.hidden = true
        
        fullAd.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: Interstitial Ad
    func close() {
        dummyView.removeFromSuperview()
        closeButton.removeFromSuperview()
    }
    
    func interstitialAdWillLoad(interstitialAd: ADInterstitialAd!) {
    }
    
    func interstitialAdDidLoad(interstitialAd: ADInterstitialAd!) {
        
        dummyView = UIView(frame: self.view.frame)
        view.addSubview(dummyView)
        
        closeButton = UIButton(frame: CGRect(x: 270, y: 25, width: 25, height: 25))
        closeButton.setTitle("\u{24CD}", forState: .Normal)
        closeButton.addTarget(self, action: "close", forControlEvents: .TouchDown)
        
        view.addSubview(closeButton)
        
        fullAd.presentInView(dummyView)
    }
    
    func interstitialAdActionDidFinish(interstitialAd: ADInterstitialAd!) {
    }
    
    func interstitialAdActionShouldBegin(interstitialAd: ADInterstitialAd!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func interstitialAd(interstitialAd: ADInterstitialAd!, didFailWithError error: NSError!) {
    }
    
    func interstitialAdDidUnload(interstitialAd: ADInterstitialAd!) {
        dummyView.removeFromSuperview()
        closeButton.removeFromSuperview()
        
    }
    
    
    //MARK: Ad Banner
    func bannerViewWillLoadAd(banner: ADBannerView!) {
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.adBannerView?.hidden = false
    }

    func bannerViewActionDidFinish(banner: ADBannerView!) {
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.adBannerView?.hidden = true
    }

}
