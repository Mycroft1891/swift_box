//
//  ViewController.swift
//  Color Picker
//
//  Created by Alexander on 10/10/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ColorPickerDelegate {
    
    @IBOutlet weak var colorPickerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userDidChoseColor(color: UIColor, withName colorName: String) {
        view.backgroundColor = color
        colorPickerLabel.text = colorName
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showColorPicker" {
            guard let colorPickerVC = segue.destination as? ColorPickerVC else { return }
            colorPickerVC.delegate = self
        }
    }

}

