//
//  FirstViewController.swift
//  Pyrus
//
//  Created by Engin KUK on 9.09.2020.
//  Copyright © 2020 Engin KUK. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let network = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        network.getServices(get: .trending, service: nil, completion: {success in
            if success {
                print(self.network.trendingServices)
            }
        })
    }
   
}

