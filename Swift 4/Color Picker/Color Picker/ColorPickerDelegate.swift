//
//  ColorPickerDelegate.swift
//  Color Picker
//
//  Created by Alexander on 10/10/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation
import UIKit

protocol ColorPickerDelegate {
    func userDidChoseColor(color: UIColor, withName colorName: String)
}
