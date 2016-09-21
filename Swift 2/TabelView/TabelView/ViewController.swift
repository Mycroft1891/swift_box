//
//  ViewController.swift
//  TabelView
//
//  Created by Lisa on 2/2/16.
//  Copyright © 2016 Sascha Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBAction func addButton(sender: UIButton) {
        insertIntoTable(textField.text)
        print(array)
    }
    
    @IBOutlet weak var textField: UITextView!
    
    
    var array : [String] = ["hello", "wllo", "ekjnfv", "eajlnvl"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //MARK: Table data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }
    
    
    
    
    //MARK: Functions
    
    func insertIntoTable(sender : AnyObject) {
        array.insert(textField.text, atIndex: 0)
    }
    
    

}

