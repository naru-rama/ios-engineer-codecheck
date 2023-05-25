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
    
    var viewModel = SearchViewModel()
    let searchBarDelegate = SearchBarDelegate()
    let tableViewDelegateAndDataSource = TableViewDelegateAndDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.text = "GitHubのリポジトリ名を入力"
        searchBarDelegate.viewController = self
        searchBar.delegate = searchBarDelegate
                
        tableViewDelegateAndDataSource.viewController = self
        tableView.delegate = tableViewDelegateAndDataSource
        tableView.dataSource = tableViewDelegateAndDataSource
        
        let nib = UINib(nibName: "RepositoryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DetailCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detail = segue.destination as? DetailViewController else { return }
        detail.viewModel = DetailViewModel(item: viewModel.selectedItem())
    }
    
}
