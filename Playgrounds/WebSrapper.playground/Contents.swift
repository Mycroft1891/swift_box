//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "http://mangafox.me/manga/onepunch_man/")!

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    guard let data = data, error == nil else {
        print(error!)
        return
    }
    
    let string = String(data: data, encoding: .utf8)
    print(string!)
}

task.resume()


//var bits: UInt32 = 0x1
//bits << 1
//bits << 2
//bits << 3
//bits << 4
