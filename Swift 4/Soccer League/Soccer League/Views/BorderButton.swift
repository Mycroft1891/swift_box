//
//  BorderButton.swift
//  Soccer League
//
//  Created by Alexander on 10/15/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class BorderButton: UIButton {

    // create custom button with white border
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.white.cgColor
    }

}
