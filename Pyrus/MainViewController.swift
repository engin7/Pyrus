//
//  MainViewController.swift
//  Pyrus
//
//  Created by Engin KUK on 9.09.2020.
//  Copyright © 2020 Engin KUK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
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

        
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let tagIndex = collectionView.tag
    switch tagIndex {
    case 0:
        return CGSize(width: 260, height: 175)
    case 1:
        return CGSize(width: 125, height: 125)
    case 2:
        return CGSize(width: 150, height: 150)
    default:
        return CGSize(width: 0, height: 0)
    }
    }
}

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           
           let index = indexPath.row
           
           switch index {
           case 0:
               return 250
           case 1:
               return 170
           case 2:
               return 220
           default:
               return 0
           }
    }
    
}