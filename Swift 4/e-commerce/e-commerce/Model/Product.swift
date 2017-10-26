//
//  Product.swift
//  e-commerce
//
//  Created by Alexander on 10/25/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation

struct Product {
    private(set) public var title: String
    private(set) public var price: String
    private(set) public var image: String
    
    init(title: String, price: String, image: String) {
        self.title = title
        self.price = price
        self.image = image
    }
}
