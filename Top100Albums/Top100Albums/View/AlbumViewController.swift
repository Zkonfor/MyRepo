//
//  AlbumViewController.swift
//  Top100Albums
//
//  Created by Zacc Konfor on 6/23/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {

   
    private let networkSession = NetworkSession()
    private let viewModel = AlbumViewModel()
    let albumTableView = UITableView()
    let mockSession = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
//        if let localData = self.mockSession.readLocalFile(forName: "MockData") {
//            self.mockSession.parseTheJson(jsonData: localData)
//        }
        setupTableView()
        

    }
    
    
    func setupTableView() {
        albumTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        albumTableView.dataSource = self
        albumTableView.delegate = self
        albumTableView.backgroundColor = .white
        view.addSubview(albumTableView)
        albumTableView.translatesAutoresizingMaskIntoConstraints = false
        albumTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        albumTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        albumTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        albumTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        networkSession.getData {
            DispatchQueue.main .async {
                self.viewModel.albumsFromNS = self.networkSession.albums
                self.albumTableView.reloadData()
            }
        }
    
    }

}

extension AlbumViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.allAlbums()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = AlbumViewCell()
        cell.backgroundColor = .black
        cell.albumLabel.text = self.viewModel.nameOfAlbum(for: indexPath.row)
        cell.artistLabel.text = self.viewModel.nameOfArtist(for: indexPath.row)
        
    let albumImage = try? UIImage(data: NSData(contentsOf: (NSURL(string: self.viewModel.coverImageUrl(for: indexPath.row) ?? "") ?? nil) as URL ) as Data)

            cell.albumImageView.image = albumImage
        
        
        cell.setupSubViews()
        
        return cell
    }
    
}

extension AlbumViewController: UITableViewDelegate {
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.albumTableView.deselectRow(at: indexPath, animated: true)
        let albumResult = self.viewModel.albumResults(for: indexPath.row)
        let detailVC = DetailViewController()
        detailVC.result = albumResult
//        let genreResult = detailVC.albumGenres(for: indexPath.row)
//        detailVC.genre = genreResult
        
//        print(genreResult as Any)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
