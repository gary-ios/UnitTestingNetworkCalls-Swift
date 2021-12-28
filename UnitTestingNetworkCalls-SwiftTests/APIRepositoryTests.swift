//
//  BeerDataManagerTests.swift
//  UnitTestingNetworkCalls-SwiftTests
//
//  Created by Gary Maccabe on 19/12/2021.
//

import XCTest
@testable import UnitTestingNetworkCalls_Swift

class BeerDataManagerTests: XCTestCase {
    
    func test_getBeerList_shouldNotBeEmpty() async throws {
        let session = NetworkSession()
        let dataManager = BeerDataManager(session: session)
        
        do {
            let beerList = try await dataManager.getBeerList()
            XCTAssertTrue(beerList.count > 0, "beer array is empty")
        } catch {
            XCTFail("Expected beer data, but failed \(error).")
        }
    }
}

class BeerMockNetworkSession: SessionProtocol {
    
    func execute(url: URL?) async throws -> Data {
        guard let url = url else { throw NetworkErrorEnum.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
