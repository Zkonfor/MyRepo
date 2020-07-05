//
//  TokenUnitTests.swift
//  TokenUnitTests
//
//  Created by Zacc Konfor on 7/3/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import XCTest
@testable import TmobileUnitTests

class TokenUnitTests: XCTestCase {

    let sut = TokenViewController()
    
    override func setUp() {
        super.setUp()
    }

    func testExample() throws {
        let indicator = sut.activityIndicator
        let button = sut.dismissButton
        let lebal = sut.textLabel
        let view = sut.mainView
        
        
        
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
