//
//  MasterViewController.swift
//  MasterDetail
//
//  Created by Lisa on 1/25/16.
//  Copyright © 2016 Sascha Luna. All rights reserved.
//

import UIKit

var objects : [String] = [String]()
var currentIndex : Int = 0
var masterView : MasterViewController?
var detailViewController : DetailViewController?


class MasterViewController: UITableViewController {
    
    
    
    
    //MARK: Variable
    var getTextField : String = ""
    
    
    //MARK: Default Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        load()
        masterView = self
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        let addButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "returnToView")
//        self.navigationItem.leftBarButtonItem = addButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        save()
        super.viewWillAppear(animated)
    }
    
    //MARK: Segue 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        detailViewController?.detailTextField.editable = true
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                currentIndex = indexPath.row
            }
            
            let object = objects[currentIndex]
            detailViewController?.detailItem = object
            detailViewController?.navigationItem.rightBarButtonItem = self.splitViewController?.displayModeButtonItem()
            detailViewController?.navigationItem.leftItemsSupplementBackButton = true
        }
    }
    


    //MARK: Table view setup
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableIdenfier", forIndexPath: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        if editing {
            detailViewController?.detailTextField.editable = false
            detailViewController?.detailTextField.text = ""
            return
        }
        
        save()
    }
    
    override func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath) {
        detailViewController?.detailTextField.editable = false
        detailViewController?.detailTextField.text = ""
        
        save()
    }


    //MARK: Functions
    func save() {
        NSUserDefaults.standardUserDefaults().setObject(objects, forKey: "note")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
    func load() {
        if let loadedData = NSUserDefaults.standardUserDefaults().arrayForKey("note") as? [String] {
            objects = loadedData
        }
    }
    
    
    func insertNewObject(sender : AnyObject) {
        if detailViewController?.detailTextField.editable == false {
            return
        }
        
        objects.insert(getTextField, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        currentIndex = 0
        self.performSegueWithIdentifier("showDetail", sender: self)
    }

}
