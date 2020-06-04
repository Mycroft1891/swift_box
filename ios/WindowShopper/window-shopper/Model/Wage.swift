//
//  Wage.swift
//  window-shopper
//
//  Created by Alexander on 10/24/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation

class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price/wage))
    }
}
