//
//  window_shopperTests.swift
//  window-shopperTests
//
//  Created by Alexander on 10/24/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import XCTest

class window_shopperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testGetHours() {
        // 324/23.5 = 14 (13.78)
        XCTAssert(Wage.getHours(forWage: 20, andPrice: 100) == 5)
        XCTAssert(Wage.getHours(forWage: 23.5, andPrice: 324) == 14)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
