//
//  File.swift
//  Top100Albums
//
//  Created by Zacc Konfor on 6/24/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import Foundation

class NetworkManager {
    
    var mockData: String?
    
    func readLocalFile(forName name: String) -> Data? {
        do {
             let dataPath = Bundle.main.path(forResource: name, ofType: "json")
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: dataPath ?? ""))
            print(dataPath ?? "")
            print(jsonData)
            return jsonData
        }
            catch {
                print(error)
            }
         return nil
        }
   
    func parseTheJson(jsonData: Data) {
       
              let decodedData = try? JSONDecoder().decode(MockData.self, from: jsonData)
        print(decodedData?.series?.titles ?? "Decoder Error")
    }
    
   
    
    func loadTheJson(fromURLString urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            urlSession.resume()
        }
    }
    
}

