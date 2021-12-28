//
//  BeerServiceProtocol.swift
//  UnitTestingNetworkCalls-Swift
//
//  Created by Gary Maccabe on 21/12/2021.
//

import Foundation

protocol SessionProtocol {
  func execute(url: URL?) async throws -> Data
}
