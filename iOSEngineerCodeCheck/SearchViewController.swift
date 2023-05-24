//
//  SearchViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var items: [Item] = []
    var activeTask: URLSessionTask?
    var selectedRepositoryIndex: Int = 0
    
    let searchBarDelegate = SearchBarDelegate()
    let tableViewDelegateAndDataSource = TableViewDelegateAndDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.text = "GitHubのリポジトリを検索できるよー"
        searchBarDelegate.viewController = self
        searchBar.delegate = searchBarDelegate
                
        tableViewDelegateAndDataSource.viewController = self
        tableView.delegate = tableViewDelegateAndDataSource
        tableView.dataSource = tableViewDelegateAndDataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detail = segue.destination as? DetailViewController else { return }
        detail.item = items[selectedRepositoryIndex]
    }
    
}
