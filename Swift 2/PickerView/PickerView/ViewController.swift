//
//  ViewController.swift
//  PickerView
//
//  Created by Lisa on 1/29/16.
//  Copyright © 2016 Sascha Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //MARK: Action & Outlet
    
    @IBOutlet weak var moodPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Variables
    var pickerSelectionArray : [String] = ["Hello", "Johoho", "Brook", "Luffy", "Zoro", "Sanji", "Nami", ]
    
    
    //MARK: Picker view data source
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerSelectionArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerSelectionArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var backgroundColor : UIColor
        
        switch row {
        case 0:
            backgroundColor = UIColor.blueColor()
        case 1:
            backgroundColor = UIColor.lightGrayColor()
        case 2:
            backgroundColor = UIColor.yellowColor()
        case 3:
            backgroundColor = UIColor.redColor()
        case 4:
            backgroundColor = UIColor.greenColor()
        default:
            backgroundColor = UIColor.blueColor()
        }
        
        self.view.backgroundColor = backgroundColor
        
    }
}

