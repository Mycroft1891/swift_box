//
//  ViewController.swift
//  LanguageTest
//
//  Created by Lisa on 1/4/16.
//  Copyright © 2016 Sascha Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var setOfDates : Set<String> = []
    
    
    //MARK: Action and Outlet
    
    @IBOutlet weak var textField: UITextView!

    @IBAction func updateButton(sender: UIButton) {
        textField.text = NSLocalizedString("TEXT_\(setOfDates.count)", comment: "AnyThings")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = NSLocalizedString("TEXT_\(setOfDates.count)", comment: "AnyThings")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func stringMyDate() -> String {
        let date = NSDate()
        let format = NSDateFormatter()
        format.dateFormat = "HH-mm-ss"
        
        return format.stringFromDate(date)
    }
    
    

}

