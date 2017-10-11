//
//  ColorPickerVC.swift
//  Color Picker
//
//  Created by Alexander on 10/10/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class ColorPickerVC: UIViewController {
    
    var delegate: ColorPickerDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func colorButton(_ sender: UIButton) {
        guard delegate != nil else { return }
            delegate?.userDidChoseColor(color: sender.backgroundColor!, withName: (sender.titleLabel?.text)!)
            self.navigationController?.popViewController(animated: true)
    }
    
}
