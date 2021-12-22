//
//  ViewController.swift
//  UnitTestingNetworkCalls-Swift
//
//  Created by Gary Maccabe on 19/12/2021.
//

import UIKit

class ViewController: UIViewController {

    private var apiRepository = APIClient.shared
      
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            let beers = try await apiRepository.getBeerData()
            print(beers.map { $0.name })
        }
    }
}

