//
//  Category.swift
//  e-commerce
//
//  Created by Alexander on 10/25/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation

struct Category {
    
    private(set) public var title: String
    private(set) public var image: String
    private(set) public var productType: ProductType
    
    init(title: String, image: String, type: ProductType) {
        self.title = title
        self.image = image
        self.productType = type
    }

}
