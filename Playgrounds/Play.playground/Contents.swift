//: Playground - noun: a place where people can play

import UIKit

class MotorVehicle {
    
    var numberOfWheels : Int?
    var numberOfSeats : Int = 4
    let topSpeedMph : Int
    var bodyColor : String
    
    init(topSpeedMph: Int, bodyColor: String) {
        self.topSpeedMph = topSpeedMph
        self.bodyColor = bodyColor
    }
    
    convenience init(topSpeedMph: Int) {
        self.init(topSpeedMph : topSpeedMph, bodyColor : "Blue")
    }
}


let ourCar = MotorVehicle(topSpeedMph: 50)
