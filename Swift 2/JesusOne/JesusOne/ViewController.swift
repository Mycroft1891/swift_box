//
//  ViewController.swift
//  JesusOne
//
//  Created by Lisa on 11/2/15.
//  Copyright © 2015 Sascha Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Variables
    
    let myStrings : [String] =
    ["Zero",
        "Jesús, el camino al Padre No se turbe vuestro corazón; creéis en Dios, creed también en mí. En la casa de mi Padre muchas moradas hay; si así no fuera, yo os lo hubiera dicho; voy, pues, a preparar lugar para vosotros. Y si me fuere y os preparare lugar, vendré otra vez, y os tomaré a mí mismo, para que donde yo estoy, vosotros también estéis. \n\nJuan 14:1-3 RVR1960",
        "Estas cosas os he hablado para que en mí tengáis paz. En el mundo tendréis aflicción; pero confiad, yo he vencido al mundo. \n\nJuan 16:33 RVR1960",
        "Antes en el corazón maquináis iniquidades; Hacéis pesar la violencia de vuestras manos en la tierra. \n\nSalmos 58:2 RVR1960",
    ]
    
    var dates : Set<String> = []
    
    
    //MARK: Outlets
    @IBOutlet weak var textField: UITextView!
    
    //MARK: Actions
    @IBAction func refreshButton(sender: UIButton) {
        textField.editable = false
        pushDateOnToSet()
    }
    
    @IBAction func fontSlider(sender: UISlider) {
        let sliderValue = CGFloat(sender.value)
        textField.font = UIFont(name: (textField.font?.fontName)!, size: sliderValue)
        
    }
    
    
    //MARK: Methods
    
    func pushDateOnToSet() {
        
        let date = NSDate()
        let format = NSDateFormatter()
        
        format.dateFormat = "dd-MM-YY-mm"
        
        let formatDate = format.stringFromDate(date)
        
        dates.insert(formatDate)
        
        if dates.count > 3 {
            dates.removeAll()
        } else {
            textField.text = myStrings[dates.count]
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dateComp : NSDateComponents = NSDateComponents()
        dateComp.year = 2015
        dateComp.month = 12
        dateComp.day = 31
        dateComp.hour = 06
        dateComp.minute = 00
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        let calender : NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        
        let date : NSDate = calender.dateFromComponents(dateComp)!
        
        let notifcation : UILocalNotification = UILocalNotification()
        notifcation.category = "FIRST_CAT"
        notifcation.alertBody = "Tu bendicion te espera; Nuevo versiculo Biblico disponible"
        notifcation.fireDate = date
        notifcation.repeatInterval = NSCalendarUnit.Minute
        
        UIApplication.sharedApplication().scheduleLocalNotification(notifcation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

