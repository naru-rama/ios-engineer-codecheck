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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchKeyword = searchBar.text, !searchKeyword.isEmpty else { return }
        
        viewController?.viewModel.fetchRepositoryData(keyword: searchKeyword) { (error) in
            if let error = error {
                print(error)
            }
            DispatchQueue.main.async {
                self.viewController?.tableView.reloadData()
            }
        }
        searchBar.resignFirstResponder()
        viewController?.sortButton.isEnabled = true
    }
    
}
