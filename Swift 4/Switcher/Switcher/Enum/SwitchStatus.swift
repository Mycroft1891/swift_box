//
//  SwitchStatus.swift
//  Switcher
//
//  Created by Alexander on 10/11/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation

enum SwitchStatus: Togglable {
    case on, off
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}
