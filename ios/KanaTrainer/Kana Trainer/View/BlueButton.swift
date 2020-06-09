//
//  BlueButton.swift
//  Kana Trainer
//
//  Created by Alexander on 10/29/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import UIKit

class BlueButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = 5
        clipsToBounds = true
    }

}
