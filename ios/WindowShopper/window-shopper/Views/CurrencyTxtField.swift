//
//  CurrencyTxtField.swift
//  window-shopper
//
//  Created by Alexander on 10/24/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

@IBDesignable
class CurrencyTxtField: UITextField {
    
    override func draw(_ rect: CGRect) {
        // create currency label square
        let size: CGFloat = frame.size.height / 2
        let currencyLabel = UILabel(frame: CGRect(x: 5, y: size - size/2, width: size, height: size))
        currencyLabel.backgroundColor = #colorLiteral(red: 0.9274666878, green: 0.9274666878, blue: 0.9274666878, alpha: 0.6116491867)
        currencyLabel.textAlignment = .center
        currencyLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currencyLabel.layer.cornerRadius = 5.0
        currencyLabel.clipsToBounds = true
        
        // setup current currency symbol
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        
        // set currency label text
        currencyLabel.text = formatter.currencySymbol
        addSubview(currencyLabel)
    }
    
    override func prepareForInterfaceBuilder() {
        updateUI()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }

    func updateUI() {
        // custom textfield
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5.0
        textAlignment = .center
        
        clipsToBounds = true
        
        // set default placeholder
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}
