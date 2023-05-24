//
//  SearchViewController+TableView.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/24.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

extension SearchViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let repository = items[indexPath.row]
        cell.textLabel?.text = repository.fullName
        cell.detailTextLabel?.text = repository.language
        cell.tag = indexPath.row
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRepositoryIndex = indexPath.row
        performSegue(withIdentifier: "Detail", sender: self)
    }
}
