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
import WatchKit
import WatchConnectivity

class ViewController: UIViewController, ADBannerViewDelegate, ADInterstitialAdDelegate, WCSessionDelegate {
    
    //MARK: IBAction & IBOutlet
    @IBOutlet var adBannerView: ADBannerView!
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    

    @IBAction func refreshButton(sender: UIButton) {
        read()
        
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
            clearData()
            save(returnDateString())
            read()
            textField.text = NSLocalizedString("TEXT_\(setOfDates.count)", comment: "Verses")
        } else {
            save(returnDateString())
            read()
            textField.text = NSLocalizedString("TEXT_\(setOfDates.count)", comment: "Verses")
        }
    
    }
    
    @IBAction func fontSlider(sender: UISlider) {
        let sliderValue = CGFloat(sender.value)
        textField.font = UIFont(name: (textField.font?.fontName)!, size: sliderValue)
    }
    
    @IBAction func twitterButton(sender: UIButton) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let twitterSheet : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText(textField.text)
            self.presentViewController(twitterSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Account", message: "Please log into your Twitter account", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func facebookButton(sender: UIButton) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let facebookSheet : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText(textField.text)
            self.presentViewController(facebookSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Account", message: "Please log into your Facebook account", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
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
        save(returnDateString())
        read()
        if setOfDates.count > 365 {
            setOfDates.removeAll()
            clearData()
            read()
            textField.text = NSLocalizedString("TEXT_\(setOfDates.count)", comment: "Verses")
        } else {
            textField.text = NSLocalizedString("TEXT_\(setOfDates.count)", comment: "Verses")
        }
        
        textField.editable = false
        
        self.canDisplayBannerAds = true
        self.adBannerView?.delegate = self
        
        // Notification Setup
        let dateComp : NSDateComponents = NSDateComponents()
        dateComp.year = 2015
        dateComp.month = 12
        dateComp.day = 31
        dateComp.hour = 06
        dateComp.minute = 00
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        let calender : NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        
        let date : NSDate = calender.dateFromComponents(dateComp)!
        
        let notifcation : UILocalNotification = UILocalNotification()
        notifcation.category = "FIRST_CAT"
        notifcation.alertBody = NSLocalizedString("BLESSING", comment: "Bless me")
        notifcation.fireDate = date
        notifcation.repeatInterval = NSCalendarUnit.Minute
        
        UIApplication.sharedApplication().scheduleLocalNotification(notifcation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: Date Functions
    func returnDateString() -> String {
        let date : NSDate = NSDate()
        let format : NSDateFormatter = NSDateFormatter()
        format.dateFormat = "dd-MM-YY-ss"
        let formateDate = format.stringFromDate(date)
        
        return formateDate
    }
    
    
    //MARK: Full Screen Advertisment Functions
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
        dummyView.removeFromSuperview()
        closeButton.removeFromSuperview()
    }
    
    func interstitialAdDidUnload(interstitialAd: ADInterstitialAd!) {
        dummyView.removeFromSuperview()
        closeButton.removeFromSuperview()
    }
    
    
    //MARK: Small Advertisment Funcions
    func bannerViewWillLoadAd(banner: ADBannerView!) {
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
    }
    
    
    
    //MARK: Core Data Functions
    func save(name:String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Data", inManagedObjectContext: managedContext)
        let options = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        options.setValue(name, forKey: "coreSetOfDates")
        
        do {
            try managedContext.save()
        } catch {
            fatalError("Couldn't save data")
        }
        
        coreSetOfDates.append(options)
    }
    
    
    func read() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Data")
        
        do {
            let fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            
            if let results : [NSManagedObject] = fetchedResults {
                for(var i = 0; i < results.count; i++) {
                    let singleResult = results[i]
                    let out = singleResult.valueForKey("coreSetOfDates") as! String
                    
                    setOfDates.insert(out)
                }
            }
        } catch {
            fatalError("could not fetch data")
        }
    }
    
    
    func clearData() {
        do {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let fetchRequest = NSFetchRequest(entityName: "Data")
            
            let fetchedResults = try managedContext.executeFetchRequest(fetchRequest)
            
            for (var i=0; i < fetchedResults.count; i++)
            {
                let value = fetchedResults[i]
                managedContext.deleteObject(value as! NSManagedObject)
                try managedContext.save()
            }
        }
        catch
        {
            print("error")
        }
    }
    

}

