//
//  APIClientTests.swift
//  UnitTestingNetworkCalls-SwiftTests
//
//  Created by Gary Maccabe on 19/12/2021.
//

import XCTest
@testable import UnitTestingNetworkCalls_Swift

class APIClientTests: XCTestCase {
    
    var baseURL: URL!
    var mockSession: URLSession!
    var apiClient: APIClient!

    override func setUpWithError() throws {
        baseURL = URL(string: "https:")!
        mockSession = MockURLSession()
        apiClient = APIClient(
            baseURL: baseURL,
            session: .shared,
            responseQueue: nil)
    }

    override func tearDownWithError() throws {
        baseURL = nil
        mockSession = nil
        apiClient = nil
        super.tearDown()
    }
    
    func test_conformsTo_BeerService() {
        XCTAssertTrue((apiClient as AnyObject) is BeerServiceProtocol)
    }
}

class MockURLSession : URLSession {
    
    override init() {
        
    }
}
