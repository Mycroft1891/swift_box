//
//  ViewController.swift
//  Camera Project
//
//  Created by Lisa on 6/5/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import UIKit
import VisualRecognitionV3

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let apiKey = "210b90292ecff7a61e54990b52ca17ec6ebbebc5"
    let version = "2017-06-16"
    var possibleResults : [String] = []

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var resultDisplay: UILabel!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { print("No image"); return }
            possibleResults.removeAll()
            imageView.image = image
            imagePicker.dismiss(animated: true, completion: nil)
            self.navigationItem.title = "Loading..."
        
            let visualRecognition = VisualRecognition(apiKey: apiKey, version: version)
        
            let imageData = UIImageJPEGRepresentation(image, 0.01)
            let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileUrl = documentsUrl.appendingPathComponent("tempImage.jpeg")
        
            try? imageData?.write(to: fileUrl, options: [])
        
            visualRecognition.classify(imageFile: fileUrl, success: { (ClassifiedImages) in
                let classes = ClassifiedImages.images.first!.classifiers.first!.classes
                for i in 0..<classes.count {
                    self.possibleResults.append(classes[i].classification)
                }
                DispatchQueue.main.async {
                    self.navigationItem.title = "Got Data"
                    self.resultDisplay.text = self.possibleResults.joined(separator: ", ")
                }
                print(self.possibleResults)
            })
    }

    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)

    }

}

