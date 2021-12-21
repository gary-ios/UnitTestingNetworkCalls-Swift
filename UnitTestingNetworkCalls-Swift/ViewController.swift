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
      _ = apiRepository.getBeer() { beers, error in
            if error == nil {
                print(beers?.map { $0.name } ?? [])
            }
        }
    }
}

