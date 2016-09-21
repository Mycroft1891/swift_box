//
//  ViewController.swift
//  CoreDataSwift2
//
//  Created by Lisa on 12/31/15.
//  Copyright © 2015 Sascha Alexander. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //MARK: Global Variables
    
    let moc = DataController().managedObjectContext
    
    var dates : Set<String> = []
    
    let textNumber : [String] = ["One", "Two", "Three", "Four", "Five", "Six", "One", "Two", "Three", "Four", "Five", "Six", "One", "Two", "Three", "Four", "Five", "Six", "One", "Two", "Three", "Four", "Five", "Six", "One", "Two", "Three", "Four", "Five", "Six", "One", "Two", "Three", "Four", "Five", "Six", "One", "Two", "Three", "Four", "Five", "Six", "One", "Two", "Three", "Four", "Five", "Six", "One", "Two", "Three", "Four", "Five", "Six", "One", "Two", "Three", "Four", "Five", "Six", "One", "Two", "Three", "Four", "Five", "Six"]
    
    
    //MARK: Outlet
    @IBOutlet weak var textView: UITextView!
    
    
    //MARK: Action
    @IBAction func refreshButton(sender: UIButton) {
        fetch()
        pushDate()
        seedDays()
        
        textView.text = textNumber[dates.count]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //seedDays()
        fetch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: Function Declaration
    
    func fetch() {
        let dateFetch = NSFetchRequest(entityName: "Days")
        
        do {
            let fetchDate = try moc.executeFetchRequest(dateFetch) as! [Days]
            print(fetchDate)
        } catch {
            fatalError("Bad things happened \(error)")
        }
    }
    
    
    func seedDays() {
        
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Days", inManagedObjectContext: moc) as! Days
        
        entity.setValue(dates.description, forKey: "days")
        
        do {
            try moc.save()
        } catch {
            fatalError("Failure to save context \(error)")
        }
    }
    
    
    func pushDate() {
        let date : NSDate = NSDate()
        let format : NSDateFormatter = NSDateFormatter()
        format.dateFormat = "HH-mm-ss"
        let formatDate = format.stringFromDate(date)
        
        dates.insert(formatDate)
        
        
    }

}

