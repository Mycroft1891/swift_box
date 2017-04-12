//
//  zipCodeTextFieldDelegate.swift
//  ModalPresentation
//
//  Created by Lisa on 4/8/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import Foundation
import UIKit

class MoneyTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    
    // receive textfield input
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newText : String
        
        if let intString = Int(textField.text!) {
            
            newText = "$" + self.dolarFromCents(value: intString) + "." + self.centsFromCents(value: intString)
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText
        
        return false
    }
    
    // dismiss keyboard when return pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // set the default value to $0.00
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "$0.00"
        }
    }
    // calculate amount of dollars based of cents passed as Int
    func dolarFromCents(value: Int) -> String {
        return String(value / 100)
    }
    
    // calculate amount of cents based of cents passed as Int
    func centsFromCents(value : Int) -> String {
        
        let cents = value % 100
        var amountOfCents = String(cents)
        
        if cents < 10 {
            amountOfCents = "0" + amountOfCents
        }
        
        return amountOfCents
    }
}
