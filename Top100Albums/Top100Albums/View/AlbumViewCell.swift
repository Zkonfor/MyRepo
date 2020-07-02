//
//  AlbumViewCell.swift
//  Top100Albums
//
//  Created by Zacc Konfor on 6/24/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import UIKit

class AlbumViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("required init has not been implemented")
    }
    
    //Album Image in the tableViewCell
    let albumImageView: UIImageView = {
        let image = UIImageView()
        // content mode
        image.contentMode = .scaleAspectFill
        // autolayout
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    
    // Album Label for tableviewCell
    let albumLabel: UILabel = {
       let theLabel = UILabel()
        theLabel.numberOfLines = 0
        theLabel.font = UIFont.init(name: "Optima-Bold", size: 20)
        theLabel.textColor = .white
        theLabel.translatesAutoresizingMaskIntoConstraints = false
        return theLabel
    }()
    
    //Artist label for tableViewCell
    let artistLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.numberOfLines = 0
        theLabel.font = UIFont.init(name: "Charter-Roman", size: 22)
        theLabel.textColor = .white
        theLabel.shadowColor = .red
        theLabel.translatesAutoresizingMaskIntoConstraints = false
        return theLabel
    }()
    
    func setupSubViews() {
        
        self.addSubview(albumImageView)
        self.addSubview(albumLabel)
        self.addSubview(artistLabel)
        
        let viewsDictionary = [
            "image": albumImageView,
            "album": albumLabel,
            "artist": artistLabel
        ]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[image(20)]-|", options: [], metrics: nil, views: viewsDictionary))
        
        albumImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
       
        
        albumLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        albumLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
         albumLabel.rightAnchor.constraint(equalTo: albumImageView.leftAnchor).isActive = true
        
        artistLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        artistLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
       
    }



}
