//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let baseURL = "https://api.bitcoinaverage.com/ticker/"
    let currencyArray = [
        "AUD", "BRL", "CAD", "CNY", "EUR",
        "GBP", "HKD", "IDR", "ILS", "INR",
        "JPY", "MXN", "NOK", "NZD", "PLN",
        "RON", "RUB", "SEK", "SGD", "USD", "ZAR"
    ]
    
    let currencySignArray = [
        "$", "R$", "$", "¥", "€", "£", "$",
        "Rp", "₪", "₹", "¥", "$", "kr", "$",
        "zł", "lei", "₽", "kr", "$", "$", "R"
    ]
    
    var finalURL = ""
    var currencyIndex : Int = 0

    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
    }

    
    //MARK: UIPickerView methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencyIndex = row
        finalURL = baseURL + currencyArray[currencyIndex]
        getBitcoinData(url: finalURL)
    }

    
    //MARK: - Networking
    func getBitcoinData(url: String) {
        Alamofire.request(url, method: .get).responseJSON { response in
            if response.result.isSuccess {
                
                print("Success, got data")
                
                let bitcoinJSON : JSON = JSON(response.result.value!)
                self.updateBitcoinData(json: bitcoinJSON)
                
            } else {
                
                print("Failed to load data")
            }
        }
    }

    
    //MARK: - JSON Parsing
    func updateBitcoinData(json: JSON) {
        if let bitcoinValue = json["last"].double {
            bitcoinPriceLabel.text = currencySignArray[currencyIndex] + String(bitcoinValue)
        } else {
            bitcoinPriceLabel.text = "Not available"
        }
    }
}
