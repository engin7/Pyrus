//
//  MainViewController.swift
//  Pyrus
//
//  Created by Engin KUK on 9.09.2020.
//  Copyright © 2020 Engin KUK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UISearchBarDelegate {
     
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    private let network = NetworkManager.shared
    private let tableViewDataSource = TableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.keyboardDismissMode = .onDrag
        searchBar.setImage(UIImage(systemName: "mic.fill"), for: .search, state: .normal)
        tableView.dataSource = tableViewDataSource
        getServices()
    }
    
    func getServices() {
        network.getServices(get: .main, service: nil, completion: {success in
            if !success {
                self.showNetworkError()
            } else {
                self.tableView.reloadData()
            }
        })
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    // MARK:- Helper Methods
    
    func showNetworkError() {
        let alert = UIAlertController(title: "Sorry...", message: "Error occured connecting the Server. Please check your connection and try again.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Retry", style: .default, handler: {
        (UIAlertAction) in
        self.getServices()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
 
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let tagIndex = collectionView.tag
    switch tagIndex {
    case 0:
        return CGSize(width: 260, height: 200)
    case 1:
        return CGSize(width: 130, height: 150)
    case 2:
        return CGSize(width: 135, height: 250)
    default:
        return CGSize(width: 0, height: 0)
    }
    }

}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let datasourceIndex = collectionView.tag
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        let myCell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        vc.receivedImage = myCell?.imageView.image
        switch datasourceIndex {
        case 2:
            let post = network.posts[indexPath.row]
            UIApplication.shared.open(NSURL(string:post.link)! as URL)
        case 1:
            let clickedService = network.otherServices[indexPath.row]
            network.getServices(get: .byId, service: clickedService, completion: {success in
                if success {
                    vc.service = self.network.serviceById
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            })
        case 0:
            let clickedService = network.trendingServices[indexPath.row]
            network.getServices(get: .byId, service: clickedService, completion: {success in
                if success {
                    vc.service = self.network.serviceById
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            })
        default: return
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
