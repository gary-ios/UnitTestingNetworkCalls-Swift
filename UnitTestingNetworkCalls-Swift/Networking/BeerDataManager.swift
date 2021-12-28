//
//  BeerDataManager.swift
//  UnitTestingNetworkCalls-Swift
//
//  Created by Gary Maccabe on 28/12/2021.
//

import Foundation

class BeerDataManager {
    
    private let sessionProtocol: SessionProtocol
    
    init(session: SessionProtocol) {
        self.sessionProtocol = session
    }
    
    func getBeerList() async throws -> [BeerModel] {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else { throw NetworkErrorEnum.invalidURL }
        let data = try await sessionProtocol.execute(url: url)
        return try JSONDecoder().decode([BeerModel].self, from: data)
    }
}
