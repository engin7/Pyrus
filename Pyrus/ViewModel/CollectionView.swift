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
        cell.title.adjustsFontSizeToFitWidth = true
        
        let datasourceIndex = collectionView.tag
        switch datasourceIndex {
        case 0:
            cell.title.text = network.trendingServices[indexPath.row].name
            return cell
        case 1:
            cell.title.text = network.otherServices[indexPath.row].name
            return cell
        case 2:
            cell.title.text = network.posts[indexPath.row].title
            return cell
        default:
            return cell
        }
//        cell.totalService.text = String(network.trendingServices[indexPath.row].totalService)
                
        let imageURL = URL(string:network.trendingServices[indexPath.row].image)
        
//        cell.image =
         
     }
    
}
