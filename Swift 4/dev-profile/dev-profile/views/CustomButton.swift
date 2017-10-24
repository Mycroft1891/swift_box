//
//  CustomButton.swift
//  dev-profile
//
//  Created by Alexander on 10/24/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10.0
        clipsToBounds = true
    }

}
