//
//  MockDataModel.swift
//  Top100Albums
//
//  Created by Zacc Konfor on 6/25/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import Foundation

struct MockData: Codable {
    let series: Series?
}

struct Series: Codable {
    let titles: [Titles]?
}

struct Titles: Codable {
    let gameOfThrones: String?
    let friends: String?
    let burnNotice: String?
    let humanTarget: String?
    let power: String?
    let theBlacklist: String?
    let numberOfTitles: Int?
}
