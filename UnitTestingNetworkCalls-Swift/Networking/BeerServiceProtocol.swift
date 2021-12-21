//
//  BeerServiceProtocol.swift
//  UnitTestingNetworkCalls-Swift
//
//  Created by Gary Maccabe on 21/12/2021.
//

import Foundation

protocol BeerServiceProtocol {
  func getBeer(completion: @escaping ([BeerModel]?, Error?) -> Void) -> URLSessionDataTask
}
