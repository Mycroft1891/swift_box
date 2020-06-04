//
//  ProductCellCollectionViewCell.swift
//  e-commerce
//
//  Created by Alexander on 10/25/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    func updateUI(product: Product) {
        productImage.image = UIImage(named: product.image)
        productLabel.text = product.title
        productPrice.text = product.price
    }
    
}
