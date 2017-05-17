//: Playground - noun: a place where people can play

import UIKit

func getMilk(_ numberOfMilks : Int) {

    print("I want \(numberOfMilks) milks")
}

func getChocolate(numberOfChocolates : Int) {
    
    print("I want \(numberOfChocolates) chocolates")
}

func returnNumberOfOrder(milkNumber: Int, chocolateNumber: Int) -> Int {
    return milkNumber + chocolateNumber
}

getMilk(2)
getChocolate(numberOfChocolates: 5)

var items = returnNumberOfOrder(milkNumber: 2, chocolateNumber: 5)
print("You ordered a total of \(items) items")