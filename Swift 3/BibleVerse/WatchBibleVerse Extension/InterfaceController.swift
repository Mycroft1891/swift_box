//
//  InterfaceController.swift
//  WatchBibleVerse Extension
//
//  Created by Lisa on 1/6/16.
//  Copyright © 2016 Sascha Alexander. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    //MARK: Outlet
    
    @IBOutlet var textLabel: WKInterfaceLabel!
    
    
    
    

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
