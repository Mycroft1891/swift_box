//
//  ViewController.swift
//  swift_core_data


import UIKit
import CoreData


class ViewController: UIViewController {

    var name_list = [NSManagedObject]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //clear everything
        clear_data()
        
        //save the data
        save("kaleidos blog")
        save("Put here what you want to store")
        
        //read the data and display it in the debug
        read()
    }

    
    
    func save(name:String)
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        //Data is in this case the name of the entity
        let entity = NSEntityDescription.entityForName("Data",
            inManagedObjectContext: managedContext)
        let options = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        
        options.setValue(name, forKey: "name")
        
        
        do {
            try managedContext.save()
        } catch
        {
            print("error")
        }


    }
    
    
    func read()
    {
        do
        {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let fetchRequest = NSFetchRequest(entityName: "Data")
            
            let fetchedResults = try managedContext.executeFetchRequest(fetchRequest)
            
            for (var i=0; i < fetchedResults.count; i++)
            {
                let single_result = fetchedResults[i]
                let out = single_result.valueForKey("name") as! String
                print(out)
                
            }
            
        }
        catch
        {
            print("error")
        }

        
    }
    
    
    func clear_data()
    {
        
        do
        {
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

