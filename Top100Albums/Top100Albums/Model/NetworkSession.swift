//
//  NetworkSession.swift
//  Top100Albums
//
//  Created by Zacc Konfor on 6/23/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//
//

import Foundation

protocol SetupViewModel {
     func albumResults(for index: Int) -> Results
       func allAlbums() -> Int
       func nameOfAlbum(for index: Int) -> String?
       func nameOfArtist(for index: Int) -> String?
       func coverImageUrl(for index: Int) -> String?
}

protocol Session {
    func getData(from url: URL, completion: ((Data?, Error?) -> Void)?)
}


extension URLSession: Session {
    func getData(from url: URL, completion: ((Data?, Error?) -> Void)?) {
        dataTask(with: url) { (data, _, error) in
            completion?(data,error)
        }.resume()
    }
}

class NetworkSession {

    let rssURL = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
    
   
    var albums: [Results] = []
   
    func getData(session: Session = URLSession.shared, _ completion: (() -> Void)?) {
        guard let rssURL = URL(string: self.rssURL) else {
            completion?()
            return
        }
        session.getData(from: rssURL) { [weak self] (data, error) in
            defer {completion?()}

            print(data ?? "")
            guard let data = data,
            error == nil,
                let apiResponse = try? JSONDecoder().decode(Albums.self, from: data) else { print("something's wrong")
                    return }
            let results = apiResponse.feed.results
            self?.albums = results
            
        
            }
            
    }
    
}
