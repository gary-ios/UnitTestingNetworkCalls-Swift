//
//  ViewController.swift
//  UnitTestingNetworkCalls-Swift
//
//  Created by Gary Maccabe on 19/12/2021.
//

import UIKit

class ViewController: UIViewController {

    private var apiRepository = APIRepository()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        apiRepository = APIRepository()
        apiRepository.session = URLSession(configuration: .default)
        apiRepository.getBeer { movies, error in
          guard let moviesArray = movies else {
            assert(movies == nil, "beer response is empty")
            return
          }
            print("fetched beer : ", moviesArray[0].name)
        }
    }
}

