//
//  DetailViewController.swift
//  MasterDetail
//
//  Created by Lisa on 1/25/16.
//  Copyright © 2016 Sascha Luna. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {
    
    //MARK: Variable
    var detailItem : AnyObject? {
        didSet {
            self.configureView()
        }
    }
    
    //MARK: Action and Outlet    
    @IBOutlet weak var detailTextField: UITextView!
    
    
    //MARK: Default function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailViewController = self
        detailTextField.becomeFirstResponder()
        detailTextField.delegate = self
        
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        objects[currentIndex] = detailTextField.text
    }
    

    //MARK: Functions
    func configureView() {
        if let label = self.detailTextField {
            label.text = objects[currentIndex]
        }
    }
    
    func saveAndUpdate() {
        masterView?.save()
        masterView?.tableView.reloadData()
    }
}
