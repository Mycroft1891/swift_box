//
//  ProductViewController.swift
//  e-commerce
//
//  Created by Alexander on 10/25/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: IBOutlets and Variables
    @IBOutlet weak var productsCollection: UICollectionView!
    private(set) public var products = [Product]()

    // MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        productsCollection.delegate = self
        productsCollection.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: IBActions & Functions
    func initProducts(category: Category) {
        products = DataService.instance.getProduct(forCategory: category.productType)
        navigationItem.title = category.title
    }
    
    // MARK: UICollecionView functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCell {
            cell.updateUI(product: products[indexPath.row])
            return cell
        } else {
            return ProductCell()
        }
    }
}
