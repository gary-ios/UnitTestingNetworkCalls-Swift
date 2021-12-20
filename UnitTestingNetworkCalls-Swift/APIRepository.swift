//
//  APIRepository.swift
//  UnitTestingNetworkCalls-Swift
//
//  Created by Gary Maccabe on 19/12/2021.
//

import Foundation

class APIRepository {
    var session: URLSession!
  
    func getBeer(completion: @escaping ([Beer]?, Error?) -> Void) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else { fatalError() }
      
        session.dataTask(with: url) { (data, response, error) in
          guard error == nil else {
            completion(nil, error)
            return
          }
          guard let data = data else {
            completion(nil, NSError(domain: "no data", code: 10, userInfo: nil))
            return
          }
          do {
            let beer = try JSONDecoder().decode([Beer].self, from: data)
            completion(beer, nil)
          } catch {
            completion(nil, error)
          }
        }.resume()
    }
}
