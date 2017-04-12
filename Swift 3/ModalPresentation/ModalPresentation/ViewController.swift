//
//  ViewController.swift
//  ModalPresentation
//
//  Created by Lisa on 4/6/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var moneyField: UITextField!
    @IBOutlet weak var sentenceField: UITextField!
    
    var moneyDelegate = MoneyTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.moneyField.delegate = moneyDelegate
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func popUpModal(_ sender: Any) {
        let imageController = UIImagePickerController()
        self.present(imageController, animated: true, completion: nil)
    }

    @IBAction func sentenceSwitch(_ sender: Any) {
    }
}

