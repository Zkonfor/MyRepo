//
//  AlbumModel.swift
//  Top100Albums
//
//  Created by Zacc Konfor on 6/23/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import Foundation
import UIKit


struct Albums: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let results: [Results]
}

struct Results: Codable {
    let artistName: String?
    let releaseDate: String?
    let name: String?
    let copyright: String?
    let artworkUrl100: String?
    let genres: [Genres]?
    let url: String?
}

struct Genres: Codable {
    let name: String?  
}

