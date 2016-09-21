//
//  ViewController.swift
//  SaveData
//
//  Created by Lisa on 1/21/16.
//  Copyright © 2016 Sascha Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextView!
    
    @IBAction func updateButton(sender: AnyObject) {
        save()
        load()
        
        textField.text = myVerses[arrayOfDates.count] + arrayOfDates.description
    }
    
    var arrayOfDates: [String] = []
    
    
    let myVerses : [String] = ["Hello", "Wello", "Wanna", "Baby"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        load()
        
        addStringDateToArray(stringMyDate())
        
        textField.text = myVerses[arrayOfDates.count] + arrayOfDates.description
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        save()
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func stringMyDate() -> String {
        let date = NSDate()
        let format = NSDateFormatter()
        format.dateFormat = "dd-MM-ss"
        let formatedDate = format.stringFromDate(date)
        
        return formatedDate
    }
    
    
    func addStringDateToArray(date: String) {
        if arrayOfDates.contains(stringMyDate()) {
            arrayOfDates.append(stringMyDate())
        }
    }
    
    
    func save() {
        NSUserDefaults.standardUserDefaults().setObject(stringMyDate(), forKey: "dates")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func load() {
        if let loadedData = NSUserDefaults.standardUserDefaults().arrayForKey("dates") as? [String] {
            arrayOfDates = loadedData
        }
    }


}

