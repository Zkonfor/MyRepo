//
//  Session.swift
//  SearchUser
//
//  Created by Zacc Konfor on 6/11/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import Foundation


class UserViewModel {
    var searchItem: String? {
        didSet {
            let messege = "new value entered ->"
            print(messege, searchItem!)
            
            if searchItem != nil {
            url = "https://api.github.com/users/\(searchItem ?? "")"
                userArray.removeAll()
            print(url!)
            }
        }
    }
    
    var url: String?
  
    var users: User?
    var userArray = [User]()
    
    func getData(session: Session = URLSession.shared, completion: (() -> Void)?) {
        print(url!)
        guard let unwrappedURL = url,
    let url = URL(string: unwrappedURL)
    else {
    completion?()
   return }
        print(url)
        session.getData(from: url) {[weak self]
            (data,_) in defer { print(data!)
                completion?() }
            guard let data = data,
                let apiResponse = try? JSONDecoder().decode(User.self, from: data) else { print("FAILED")
                    return}
            print(apiResponse)
            self?.users = apiResponse
            self?.userArray.append((self?.users)!)
                
            }
        }
    
    func numberOfUsers() -> Int {
           return self.userArray.count
       }
       
       func userIndex(for index: Int) -> User {
           return self.userArray[index]
    }
}
