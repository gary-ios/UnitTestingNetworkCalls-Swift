//
//  ViewController.swift
//  UnitTestingNetworkCalls-Swift
//
//  Created by Gary Maccabe on 19/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let session = NetworkSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let apiRepository = BeerDataManager(session: session)
        
        Task {
            let beerList = try await apiRepository.getBeerList()
            print(beerList.map { $0.name })
        }
    }
}
