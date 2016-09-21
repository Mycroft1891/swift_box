//
//  ViewController.swift
//  CoreDataApp
//
//  Created by Lisa on 1/1/16.
//  Copyright © 2016 Sascha Alexander. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //MARK: Variables
    
    var setOfDates : Set<String> = []
    
    var arrayOfTexts : [String] = ["One", "Two", "Three", "Four", "Five", "One", "Two", "Three", "Four", "Five", "One", "Two", "Three", "Four", "Five", "One", "Two", "Three", "Four", "Five", "One", "Two", "Three", "Four", "Five", "One", "Two", "Three", "Four", "Five", "One", "Two", "Three", "Four", "Five", "One", "Two", "Three", "Four", "Five"]
    
    var coreSetOfDates = [NSManagedObject]()
    
    
    //MARK: Actions & Outlets
    
    @IBOutlet weak var textField: UITextView!
    @IBAction func refreshButton(sender: UIButton) {
        save(returnDateString())
        read()
        
        textField.text = arrayOfTexts[setOfDates.count]
    }
    
    
    //MARK: Init functions

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: Functions
    
    func returnDateString() -> String {
        let date : NSDate = NSDate()
        let format : NSDateFormatter = NSDateFormatter()
        format.dateFormat = "dd-MM-YY-HH-mm-ss"
        let formateDate = format.stringFromDate(date)
        
        return formateDate
    }
    
    
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
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObject = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Data")
        
        do {
            let fetchedResults = try managedObject.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            
            if let results : [NSManagedObject] = fetchedResults {
                for (var i = 0; i < results.count; i++) {
                    let value = results[i]
                    managedObject.deleteObject(value)
                    
                    do {
                        try managedObject.save()
                    } catch {
                        fatalError("Couldn't save data")
                    }
                }
            }
        } catch {
            fatalError("Could not delete core data")
        }
    }
}

