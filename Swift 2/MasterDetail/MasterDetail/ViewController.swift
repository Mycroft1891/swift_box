//
//  ViewController.swift
//  MasterDetail
//
//  Created by Lisa on 1/25/16.
//  Copyright © 2016 Sascha Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Action and Outlet    
    @IBOutlet weak var textField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = NSLocalizedString("text", comment: "text")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        storyboard?.instantiateViewControllerWithIdentifier("masterView")
        
        if segue.identifier == "showEdit" {
            let masterTextField : MasterViewController = segue.destinationViewController as! MasterViewController
            
            masterTextField.getTextField = textField.text
            masterTextField.insertNewObject(self)
        }
    }
}

