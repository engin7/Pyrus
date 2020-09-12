//
//  Service.swift
//  Pyrus
//
//  Created by Engin KUK on 9.09.2020.
//  Copyright © 2020 Engin KUK. All rights reserved.
//

import Foundation

// Network Response
struct Root:  Codable {
    let trending : [Service]
    let other : [Service]
    let posts : [Post]
}

struct Service: Codable {
    
    var name           = ""
    var longName       = ""
    var image          = ""
    var totalService   = 0
    var id             = 0
    var serviceId      = 0.0
    var rating: Float?
    var jobsDone: Float?
    
    enum CodingKeys: String, CodingKey {
        case totalService = "pro_count"
        case image = "image_url"
        case serviceId = "service_id"
        case longName = "long_name"
        case rating = "average_rating"
        case jobsDone = "completed_jobs_on_last_month"
        case id, name
    }
    
}

struct Post: Codable {
    
    var category  = ""
    var title     = ""
    var link      = ""
    var image     = ""
    
    enum CodingKeys: String, CodingKey {
        case image = "image_url"
        case title, category, link
    }
    
}
