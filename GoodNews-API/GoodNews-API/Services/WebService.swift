//
//  WebService.swift
//  GoodNews-API
//
//  Created by Ravi Navarro  on 09/09/21.
//

import Foundation

class WebServices {
    
    func getArticles(url: URL, completion: @escaping ([Any]?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { data , response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                print(data)
                
            }
            
        }.resume()
    }
}
