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
    var mockSession: MockURLSession!
    var apiClient: APIClient!

    override func setUpWithError() throws {
        baseURL = URL(string: "")!
        //mockSession = MockURLSession()
        apiClient = APIClient(
            baseURL: baseURL,
            session: mockSession,
            responseQueue: nil)
    }

    override func tearDownWithError() throws {
        
    }
    
}

class MockURLSession : URLSession {
    
}
