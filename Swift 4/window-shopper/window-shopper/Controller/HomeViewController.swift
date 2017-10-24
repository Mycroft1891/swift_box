//
//  ViewController.swift
//  window-shopper
//
//  Created by Alexander on 10/24/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var wageTxt: CurrencyTxtField!
    @IBOutlet weak var priceTxt: CurrencyTxtField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    // MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: IBActions & methods
    @IBAction func clearCalcutaroPressed(_ sender: UIButton) {
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
    func createButton() {
        // create button frame, title, color
        let calculatorButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calculatorButton.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        calculatorButton.setTitle("Calculate", for: .normal)
        calculatorButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        // add action upon pressed
        calculatorButton.addTarget(self, action: #selector(HomeViewController.calculate), for: .touchUpInside)
        
        // attack buttons to keyboards
        wageTxt.inputAccessoryView = calculatorButton
        priceTxt.inputAccessoryView = calculatorButton
    }
    
    @objc func calculate() {
        // Validate textfield are numbers & not empty
        guard let wage = wageTxt.text, let price = priceTxt.text else { return }
        guard let w = Double(wage), let p = Double(price) else { return }
        
        view.endEditing(true)
        resultLabel.isHidden = false
        hoursLabel.isHidden = false
        resultLabel.text = String(Wage.getHours(forWage: w, andPrice: p))
    }
    

}

