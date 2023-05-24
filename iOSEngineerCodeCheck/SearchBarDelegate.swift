//
//  SearchBarDelegate.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/25.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchBarDelegate: NSObject, UISearchBarDelegate {
    
    weak var viewController: SearchViewController?
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.text = ""
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewController?.activeTask?.cancel()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchKeyword = searchBar.text, !searchKeyword.isEmpty else { return }
        
        let repositoryService = RepositoryService.shared
        repositoryService.fetchRepositoryData(keyword: searchKeyword) { [weak self] (result) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.viewController?.items = data.items
                    self?.viewController?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
