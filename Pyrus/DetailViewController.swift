//
//  DetailViewController.swift
//  Pyrus
//
//  Created by Engin KUK on 12.09.2020.
//  Copyright © 2020 Engin KUK. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var numberOfPros: UILabel!
    @IBOutlet weak var rating: UILabel!
    var receivedImage: UIImage?
    var service: Service?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = receivedImage
        detailTitle.text = service?.name
        if service?.totalService != nil {
            numberOfPros.text = String((service?.totalService)!)
        }
        if service?.rating != nil {
            rating.text = String((service?.rating)!)
        }
  
    }
    
    
    
    
}
