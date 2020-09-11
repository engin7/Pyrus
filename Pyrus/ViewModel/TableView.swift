//
//  TableView.swift
//  Pyrus
//
//  Created by Engin KUK on 11.09.2020.
//  Copyright © 2020 Engin KUK. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3 //Root
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for:indexPath) as! TableViewCell
        cell.collectionView.tag = indexPath.row
        
        let index = indexPath.row
    
        switch index {
        case 0:
            cell.header.text = "Trending Services"
        case 1:
            cell.header.text = "Temizlik"
         case 2:
            cell.header.text = "Latest from the blog"
        default:
            cell.header.text = ""
        }
        cell.collectionView.reloadData()

        return cell
    }
      
   
}

