//
//  SearchViewController+SearchBar.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/24.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

extension SearchViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.text = ""
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        activeTask?.cancel()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchKeyword = searchBar.text, !searchKeyword.isEmpty else { return }
        
        let repositoryService = RepositoryService.shared
        repositoryService.fetchRepositoryData(keyword: searchKeyword) { [weak self] (result) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.items = data.items
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
