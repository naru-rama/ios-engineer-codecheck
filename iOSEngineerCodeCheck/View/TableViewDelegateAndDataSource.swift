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
    let imageDownloader = ImageDownloader()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController?.viewModel.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? RepositoryCell else {
            fatalError("The dequeued cell is not an instance of CustomTableViewCell.")
        }
        guard let repository = viewController?.viewModel.items[indexPath.row] else { return cell }
        cell.languageTextLabel.text = repository.fullName
        cell.starTextLabel.text = String(repository.starCount)
        cell.forkTextLabel.text = String(repository.forkCount)
        cell.issueTextLabel.text = String(repository.issueCount)
        
        imageDownloader.downloadImage(from: repository.owner.avatarUrl) { image in
            cell.avatarImageVIew.image = image
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController?.viewModel.selectedRepositoryIndex = indexPath.row
        viewController?.performSegue(withIdentifier: "Detail", sender: self)
    }
    
}
