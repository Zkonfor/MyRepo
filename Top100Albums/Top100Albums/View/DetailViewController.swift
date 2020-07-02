//
//  DetailViewController.swift
//  Top100Albums
//
//  Created by Zacc Konfor on 6/29/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

// genre, release date, and copyright info below the image

import UIKit

class DetailViewController: UIViewController {

   
    var result: Results?
    var genre: Genres?
    let viewModel = AlbumViewModel()
    var artwork: UIImageView?
    var album: UILabel?
    var urlPush: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.title = result?.name
        setOutlets()
        
    }
    
//    func albumGenres(for index: Int) -> Genres? {
//        return result?.genres?[index] 
//      }

    func setOutlets() {
        
        view.addSubview(albumImageView)
        view.addSubview(albumLabel)
        // Cover Image
        artwork = albumImageView
        let theImage = try? UIImage(data: NSData(contentsOf: (NSURL(string: result?.artworkUrl100 ?? "") ?? nil) as URL ) as Data)
        artwork?.image = theImage
        
        // Album Name, Artist name, Genre, Release Date, Copyright
        album = albumLabel
        album?.text = "ALBUM: \(result?.name ?? "") \nARTIST: \(result?.artistName ?? "") \nGENRE: \(genre?.name ?? "") \nRELEASE DATE: \(result?.releaseDate ?? "") \nCOPYRIGHT: \(result?.copyright ?? "")"
        
        // Cover Image constraints
        artwork?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        artwork?.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        artwork?.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        artwork?.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        // Text Constraints
        album?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        album?.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        album?.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        album?.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        // Button Constraints
      
        
        
    }
    
    
    let albumImageView: UIImageView = {
          let image = UIImageView()
          // content mode
          image.contentMode = .scaleToFill
          // autolayout
          image.translatesAutoresizingMaskIntoConstraints = false
          return image
      }()
     
      let albumLabel: UILabel = {
         let theLabel = UILabel()
          theLabel.numberOfLines = 0
          theLabel.font = UIFont.init(name: "Optima-Bold", size: 20)
          theLabel.textColor = .white
          theLabel.translatesAutoresizingMaskIntoConstraints = false
          return theLabel
      }()
        
    let urlButton: UIButton = {
        let theButton = UIButton()
        theButton.titleLabel?.textColor = .systemYellow
        theButton.titleLabel?.highlightedTextColor = .black
        theButton.titleLabel?.font = UIFont.init(name: "Palatino-Roman", size: 25)
        theButton.translatesAutoresizingMaskIntoConstraints = false
        return theButton
    }()
    

}
