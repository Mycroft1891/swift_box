//
//  ViewController.swift
//  BrowserApp
//
//  Created by Lisa on 1/21/16.
//  Copyright © 2016 Sascha Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Action and Outlet
    
    
    @IBOutlet weak var addressBar: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    
    @IBOutlet weak var webView: UIWebView!

    @IBAction func backButton(sender: UIButton) {
        webView.goBack()
    }
    @IBAction func forwardButton(sender: UIButton) {
        webView.goForward()
    }
    @IBAction func goButton(sender: UIButton) {
        if addressBar.text == "" {
            return
        }
        
        guard let text : String = addressBar.text else
        {
            return
        }
        addressLabel.hidden = true
        
        if text.rangeOfString(".") != nil {
            var finalString : String = text.lowercaseString
            if text.rangeOfString("http://") == nil {
                finalString = "http://\(finalString)"
                self.loadURL(finalString)
            }
            
            self.loadURL(finalString)
            
        } else {
            let searchString = text.stringByReplacingOccurrencesOfString(" ", withString: "+")
            let finalString = "http://www.google.com/search?q=\(searchString)"
            self.loadURL(finalString)
            }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // loadURL("http://www.bendicionesdedios.com")
        // addressLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Functions
    
    func loadURL(url : String) {
        let url = NSURL(string: url)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }


}

