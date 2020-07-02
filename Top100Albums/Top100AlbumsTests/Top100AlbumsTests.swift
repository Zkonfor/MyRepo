//
//  Top100AlbumsTests.swift
//  Top100AlbumsTests
//
//  Created by Zacc Konfor on 6/23/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//


import XCTest
@testable import Top100Albums

class Top100AlbumsTests: XCTestCase {
    var sut: URLSession?

    override func setUpWithError() throws {
        super.setUp()
        sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

    // Asynchronous test: success fast, failure slow

    func testStatusCode () throws {
        
        let url = URL(string: "")
    }

}
