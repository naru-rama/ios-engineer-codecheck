//
//  TableViewDelegateAndDataSource.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/25.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

class TableViewDelegateAndDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var viewController: SearchViewController?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController?.viewModel.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        guard let repository = viewController?.viewModel.items[indexPath.row] else { return cell }
        cell.textLabel?.text = repository.fullName
        cell.detailTextLabel?.text = repository.language
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController?.viewModel.selectedRepositoryIndex = indexPath.row
        viewController?.performSegue(withIdentifier: "Detail", sender: self)
    }
}
