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
        
        //GitHub APIからJSONファイルを取得し、リポジトリの情報をrepositoriesに格納
        let requestURL = "https://api.github.com/search/repositories?q=\(searchKeyword)"
        guard let url = URL(string: requestURL) else { return }
        activeTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let strongSelf = self, let data = data else { return }
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any], let items = jsonObject["items"] as? [[String: Any]] else { return }
                strongSelf.repositories = items
            } catch {
                print("JSON parsing error: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                strongSelf.tableView.reloadData()
            }
        }
        activeTask?.resume()
    }
}
