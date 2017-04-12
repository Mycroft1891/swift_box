//
//  ViewController.swift
//  BibleVerse
//
//  Created by Lisa on 1/3/16.
//  Copyright © 2016 Sascha Alexander. All rights reserved.
//

import UIKit
import CoreData
import iAd
import Social

class ViewController: UIViewController, ADBannerViewDelegate, ADInterstitialAdDelegate {
    
    //MARK: IBAction & IBOutlet
    @IBOutlet var adBannerView: ADBannerView!
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    

    @IBAction func refreshButton(_ sender: UIButton) {
        
        switch setOfDates.count {
        case 0...3:
            backgroundImage.image = UIImage(named: "backgroundImageOne")
        case 4...7:
            backgroundImage.image = UIImage(named: "backgroundImageTwo")
        default:
            backgroundImage.image = UIImage(named: "backgroundImageThree")
        }
        
        if setOfDates.count > 9 {
            setOfDates.removeAll()
            textField.text = NSLocalizedString("TEXT_\(setOfDates.count)", comment: "Verses")
        } else {
            textField.text = NSLocalizedString("TEXT_\(setOfDates.count)", comment: "Verses")
        }
    
    }
    
    @IBAction func fontSlider(_ sender: UISlider) {
        let sliderValue = CGFloat(sender.value)
        textField.font = UIFont(name: (textField.font?.fontName)!, size: sliderValue)
    }
    
    @IBAction func twitterButton(_ sender: UIButton) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            let twitterSheet : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText(textField.text)
            self.present(twitterSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Account", message: "Please log into your Twitter account", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func facebookButton(_ sender: UIButton) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            let facebookSheet : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText(textField.text)
            self.present(facebookSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Account", message: "Please log into your Facebook account", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    //MARK: Variables
    var setOfDates : Set<String> = []
    
    var coreSetOfDates = [NSManagedObject]()
    
    var fullAd = ADInterstitialAd()
    var dummyView : UIView!
    var closeButton : UIButton!
    
    //MARK: Default Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Change background Image
        switch setOfDates.count {
        case 0...3:
            backgroundImage.image = UIImage(named: "backgroundImageOne")
        case 4...7:
            backgroundImage.image = UIImage(named: "backgroundImageTwo")
        default:
            backgroundImage.image = UIImage(named: "backgroundImageThree")
        }
        
        // Full Screen Ad Setup
        fullAd.delegate = self
        
        // View Setup
        if setOfDates.count > 365 {
            setOfDates.removeAll()
            textField.text = NSLocalizedString("TEXT_\(setOfDates.count)", comment: "Verses")
        } else {
            textField.text = NSLocalizedString("TEXT_\(setOfDates.count)", comment: "Verses")
        }
        
        textField.isEditable = false
        
        self.canDisplayBannerAds = true
        self.adBannerView?.delegate = self
        
        // Notification Setup
        var dateComp : DateComponents = DateComponents()
        dateComp.year = 2015
        dateComp.month = 12
        dateComp.day = 31
        dateComp.hour = 06
        dateComp.minute = 00
        (dateComp as NSDateComponents).timeZone = TimeZone.current
        
        let calender : Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        let date : Date = calender.date(from: dateComp)!
        
        let notifcation : UILocalNotification = UILocalNotification()
        notifcation.category = "FIRST_CAT"
        notifcation.alertBody = NSLocalizedString("BLESSING", comment: "Bless me")
        notifcation.fireDate = date
        notifcation.repeatInterval = NSCalendar.Unit.minute
        
        UIApplication.shared.scheduleLocalNotification(notifcation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: Date Functions
    func returnDateString() -> String {
        let date : Date = Date()
        let format : DateFormatter = DateFormatter()
        format.dateFormat = "dd-MM-YY-ss"
        let formateDate = format.string(from: date)
        
        return formateDate
    }
    
    
    //MARK: Full Screen Advertisment Functions
    func close() {
        dummyView.removeFromSuperview()
        closeButton.removeFromSuperview()
    }
    
    func interstitialAdWillLoad(_ interstitialAd: ADInterstitialAd!) {
    }
    
    func interstitialAdDidLoad(_ interstitialAd: ADInterstitialAd!) {
        dummyView = UIView(frame: self.view.frame)
        view.addSubview(dummyView)
        
        closeButton = UIButton(frame: CGRect(x: 270, y: 25, width: 25, height: 25))
        closeButton.setTitle("\u{24CD}", for: UIControlState())
        closeButton.addTarget(self, action: #selector(ViewController.close), for: .touchDown)
        
        view.addSubview(closeButton)
        fullAd.present(in: dummyView)
    }
    
    func interstitialAdActionDidFinish(_ interstitialAd: ADInterstitialAd!) {
    }
    
    func interstitialAdActionShouldBegin(_ interstitialAd: ADInterstitialAd!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func interstitialAd(_ interstitialAd: ADInterstitialAd!, didFailWithError error: Error!) {
        dummyView.removeFromSuperview()
        closeButton.removeFromSuperview()
    }
    
    func interstitialAdDidUnload(_ interstitialAd: ADInterstitialAd!) {
        dummyView.removeFromSuperview()
        closeButton.removeFromSuperview()
    }
    
    
    //MARK: Small Advertisment Funcions
    func bannerViewWillLoadAd(_ banner: ADBannerView!) {
    }
    
    func bannerViewDidLoadAd(_ banner: ADBannerView!) {
    }
    
    func bannerViewActionDidFinish(_ banner: ADBannerView!) {
    }
    
    func bannerViewActionShouldBegin(_ banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerView(_ banner: ADBannerView!, didFailToReceiveAdWithError error: Error!) {
    }
}

