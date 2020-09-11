//
//  MainViewController.swift
//  Pyrus
//
//  Created by Engin KUK on 9.09.2020.
//  Copyright © 2020 Engin KUK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private let network = NetworkManager.shared
    private let tableViewDataSource = TableViewDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = tableViewDataSource
        network.getServices(get: .trending, service: nil, completion: {success in
                  if success {
                    self.tableView.reloadData()
                   }
              })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           
           let index = indexPath.row
           
           switch index {
           case 0:
               return 250
           case 1:
               return 180
           case 2:
               return 250
           default:
               return 0
           }
    }
        
}

