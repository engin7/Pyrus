//
//  TrendingServicesCell.swift
//  Pyrus
//
//  Created by Engin KUK on 10.09.2020.
//  Copyright © 2020 Engin KUK. All rights reserved.
//



import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var totalService: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.isUserInteractionEnabled = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
}
