//
//  APIClient.swift
//  UnitTestingNetworkCalls-Swift
//
//  Created by Gary Maccabe on 19/12/2021.
//

import Foundation

class APIClient {
  
    private let baseURL: URL
    private let session: URLSession
    private let responseQueue: DispatchQueue?
  
    static let shared = APIClient(
        baseURL: URL(string: "https://api.punkapi.com/v2/")!,
        session: .shared,
        responseQueue: .main
    )

    init(baseURL: URL, session: URLSession, responseQueue: DispatchQueue?) {
        self.baseURL = baseURL
        self.session = session
        self.responseQueue = responseQueue
    }
    
    func getBeerData() async throws -> [BeerModel] {
        guard let url = URL(string: "beers", relativeTo: baseURL) else { throw FetchError.invalidURL }
        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode([BeerModel].self, from: data)
    }
}


enum FetchError: Error {
    case invalidURL
    case missingData
}
