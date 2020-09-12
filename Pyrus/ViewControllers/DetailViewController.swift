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
    @IBOutlet weak var jobsDone: UILabel!
    var receivedImage: UIImage?
    var service: Service?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.locale = Locale(identifier: "tr_TR")

        imageView.image = receivedImage
        detailTitle.text = service?.name
        if service?.jobsDone != nil {
            if (service?.jobsDone)! > 0 {
            jobsDone.text = "Geçen ay " + fmt.string(from: NSNumber(value: (service?.jobsDone)!))! + " " + (service?.longName)! +  " işi yapıldı"
            } else {
            jobsDone.text = "Geçen ay " + (service?.longName)! +  " işi yapılmadı"
            }
        }
        
        if service?.totalService != nil {
            let pros = fmt.string(from: NSNumber(value: (service?.totalService)!))
            let text = pros! + " pros near you"
            let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: text)
            attributedString.setColor(color: UIColor.orange, forText: pros!)
            numberOfPros.attributedText = attributedString
        }
        if service?.rating != nil {
            let rate = fmt.string(from: NSNumber(value: (service?.rating)!))
            let text = rate! + " avarage rating"
            let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: text)
            attributedString.setColor(color: UIColor.orange, forText: rate!)
            rating.attributedText = attributedString
        }
    }
    
}

// An attributed string extension to achieve colors on text.
extension NSMutableAttributedString {

    func setColor(color: UIColor, forText stringValue: String) {
       let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }

}
