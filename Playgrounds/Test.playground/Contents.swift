//: Playground - noun: a place where people can play

import UIKit

func addDoubles(double: Double...) -> Double {
    return double.reduce(0, combine: +)
}

addDoubles(3.5, 20.5, 4.5)