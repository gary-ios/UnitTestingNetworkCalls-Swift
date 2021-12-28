//
//  NetworkSession.swift
//  UnitTestingNetworkCalls-Swift
//
//  Created by Gary Maccabe on 19/12/2021.
//

import Foundation

class NetworkSession: SessionProtocol {
    
    func execute(url: URL?) async throws -> Data {
        guard let url = url else { throw NetworkErrorEnum.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
