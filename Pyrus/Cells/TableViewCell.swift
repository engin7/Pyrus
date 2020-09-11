//
//  TableViewCell.swift
//  Pyrus
//
//  Created by Engin KUK on 11.09.2020.
//  Copyright © 2020 Engin KUK. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet  weak var collectionView: UICollectionView!
    @IBOutlet  weak var header: UILabel!

    private let network = NetworkManager.shared
    private let collectionViewDataSource = CollectionViewDataSource()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = collectionViewDataSource
        self.contentView.isUserInteractionEnabled = true
        
    }
  
}
