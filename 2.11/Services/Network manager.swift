//
//  Network manager.swift
//  2.11
//
//  Created by Ekaterina Kugeneva on 01.12.2021.
//

import Foundation
import Alamofire
class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData (from url: String?, with completion: @escaping(WebInformation) -> Void) {
        
        guard let url = URL(string: url ?? "") else { return }
        print (url)
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let info = try JSONDecoder().decode(WebInformation.self, from: data)
                // print (info)
                DispatchQueue.main.async {
                    completion(info)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    
    
    
    
    
}


