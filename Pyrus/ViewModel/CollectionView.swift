//
//  CollectionView.swift
//  Pyrus
//
//  Created by Engin KUK on 10.09.2020.
//  Copyright © 2020 Engin KUK. All rights reserved.
//

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {

    private let network = NetworkManager.shared
    private var downloadTask: URLSessionDownloadTask?
    
    deinit {
        downloadTask?.cancel() }
    // when object instance is deallocated cancel download in progress
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let datasourceIndex = collectionView.tag
        switch datasourceIndex {
        case 0:
            return network.trendingServices.count
        case 1:
            return network.otherServices.count
        case 2:
            return network.posts.count
        default:
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
 
        let datasourceIndex = collectionView.tag
        switch datasourceIndex {
        case 0:
            cell.title.text = network.trendingServices[indexPath.row].name
            cell.title.font = .boldSystemFont(ofSize: 16)
            cell.totalService.text = String(network.trendingServices[indexPath.row].totalService) + " Pros near you"
            cell.totalService.alpha = 0.5
            
            if let imageURL = URL(string: network.trendingServices[indexPath.row].image) {
                downloadTask = network.loadImage(imageView: cell.image, url: imageURL)
            }
            
            return cell
        case 1:
            cell.title.text = network.otherServices[indexPath.row].name
            cell.title.font = .boldSystemFont(ofSize: 12)
            cell.totalService.text = String(network.otherServices[indexPath.row].totalService) + " Pros near you"
            cell.totalService.alpha = 0.5
            
            if let imageURL = URL(string: network.otherServices[indexPath.row].image) {
                downloadTask = network.loadImage(imageView: cell.image, url: imageURL)
            }
            
            return cell
        case 2:
            cell.title.text = network.posts[indexPath.row].category
            cell.title.textColor = UIColor(red: 0.28, green: 0.29, blue: 0.30, alpha: 1.00)
            cell.title.font = .boldSystemFont(ofSize: 14)
            cell.totalService.text = network.posts[indexPath.row].title
            cell.totalService.textColor = .white
            
            if let imageURL = URL(string: network.posts[indexPath.row].image) {
                          downloadTask = network.loadImage(imageView: cell.image, url: imageURL)
                      }
            
             return cell
        default:
            return cell
        }
  
     }
    
}
