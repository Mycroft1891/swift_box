//
//  DataService.swift
//  e-commerce
//
//  Created by Alexander on 10/25/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation

// singleton
class DataService {
    static let instance = DataService()
    
    // data for tableView
    private let categories = [
        Category(title: "SHIRTS", image: "shirts.png", type: ProductType.shirts),
        Category(title: "HOODIES", image: "hoodies.png", type: ProductType.hoodies),
        Category(title: "HATS", image: "hats.png", type: ProductType.hats),
        Category(title: "DIGITALS", image: "digital.png", type: ProductType.digitals)
    ]
    
    private let hats = [
        Product(title: "Unique Black Hat logo", price: "$24.99", image: "hat01.png"),
        Product(title: "Original UT Hat Graphic", price: "$19.99", image: "hat02.png"),
        Product(title: "Fantasy Style UQ Hat Graphic", price: "$44.99", image: "hat03.png"),
        Product(title: "Limited Edition UQ Hat", price: "$76.99", image: "hat04.png"),
    ]
    
    private let hoodies = [
        Product(title: "Unique Black Hoodie logo", price: "$24.99", image: "hoodie01.png"),
        Product(title: "Original UT Hoodie Graphic", price: "$19.99", image: "hoodie02.png"),
        Product(title: "Fantasy Style UQ Hoodie Graphic", price: "$44.99", image: "hoodie03.png"),
        Product(title: "Limited Edition UQ Hoodie", price: "$76.99", image: "hoodie04.png"),
    ]
    
    private let shirts = [
        Product(title: "Unique Black Shirt logo", price: "$24.99", image: "shirt01.png"),
        Product(title: "Original UT Shirt Graphic", price: "$19.99", image: "shirt02.png"),
        Product(title: "Fantasy Style UQ Shirt Graphic", price: "$44.99", image: "shirt03.png"),
        Product(title: "Limited Edition UQ Shirt", price: "$76.99", image: "shirt04.png"),
    ]
    
    private let digitals = [Product]()
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getProduct(forCategory product: ProductType) -> [Product] {
        switch product {
        case .hats:
            return hats
        case .hoodies:
            return hoodies
        case .shirts:
            return shirts
        case .digitals:
            return digitals
        }
    }
    
}
