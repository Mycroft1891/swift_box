//
//  TableViewCell.swift
//  e-commerce
//
//  Created by Alexander on 10/25/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!

    func updateUI(category: Category) {
        categoryImage.image = UIImage(named: category.image)
        categoryLabel.text = category.title
    }
}
