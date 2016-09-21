//: Playground - noun: a place where people can play

import UIKit

var someRandomNumber : [Int] = []

var hiraganaR : [String] = ["KA", "KI", "KU", "KE", "KO", "SA", "SHI", "SU", "SE", "SO", "TA", "CHI", "TSU", "TE", "TO"]

func getMyRandomNumbers() {
    while someRandomNumber.count < 5 {
        let rand = Int(arc4random_uniform(UInt32(9)))
        if someRandomNumber.contains(rand) {
            print("Do nothing")
        } else {
            someRandomNumber.append(rand)
        }
    }
}

func setMyButtonText(integerArray : [Int]) {
    
}


getMyRandomNumbers()
print(someRandomNumber)

hiraganaR.randomItem()