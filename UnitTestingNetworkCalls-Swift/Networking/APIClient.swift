//
//  APIClient.swift
//  UnitTestingNetworkCalls-Swift
//
//  Created by Gary Maccabe on 19/12/2021.
//

import Foundation

class APIClient: BeerServiceProtocol {
  
  private let baseURL: URL
  private let session: URLSession
  private let responseQueue: DispatchQueue?
  
  static let shared = APIClient(baseURL: URL(string: "https://api.punkapi.com/v2/")!,
    session: .shared,
    responseQueue: .main
  )
  
  init(baseURL: URL,
       session: URLSession,
       responseQueue: DispatchQueue?) {
    self.baseURL = baseURL
    self.session = session
    self.responseQueue = responseQueue
  }
  
  func getBeer(completion: @escaping ([Beer]?, Error?) -> Void) -> URLSessionDataTask {
    let url = URL(string: "beers", relativeTo: baseURL)!
    let task = session.dataTask(with: url) { [weak self] data, response, error in
      guard let self = self else { return }
      guard let response = response as? HTTPURLResponse,
        response.statusCode == 200,
        error == nil,
        let data = data else {
          self.dispatchResult(error: error, completion: completion)
          return
      }
      let decoder = JSONDecoder()
      do {
        let beers = try decoder.decode([Beer].self, from: data)
        self.dispatchResult(models: beers, completion: completion)
      } catch {
        self.dispatchResult(error: error, completion: completion)
      }
    }
    task.resume()
    return task
  }
  
  private func dispatchResult<Type>(models: Type? = nil, error: Error? = nil, completion: @escaping (Type?, Error?) -> Void) {
        
    guard let responseQueue = responseQueue else {
      completion(models, error)
      return
    }
    responseQueue.async {
      completion(models, error)
    }
  }
}
