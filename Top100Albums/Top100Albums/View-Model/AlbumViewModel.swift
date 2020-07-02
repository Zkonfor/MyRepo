//
//  AlbumViewModel.swift
//  Top100Albums
//
//  Created by Zacc Konfor on 6/23/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import Foundation

class AlbumViewModel: SetupViewModel {
    var genre: Genres?
    
    
    func albumResults(for index: Int) -> Results {
        return albumsFromNS[index]
    }
    
    
    func allAlbums() -> Int {
       return self.albumsFromNS.count
    }
    
    func nameOfAlbum(for index: Int) -> String? {
       return self.albumsFromNS[index].name
        
    }
    
    func nameOfArtist(for index: Int) -> String? {
       return self.albumsFromNS[index].artistName
    }
    
    func coverImageUrl(for index: Int) -> String? {
       return self.albumsFromNS[index].artworkUrl100
    }
    
    var albumsFromNS: [Results] = [] 
    
    
}



