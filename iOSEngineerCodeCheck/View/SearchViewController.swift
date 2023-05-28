//
//  SearchViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, SortViewControllerDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sortButton: UIBarButtonItem!
    
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
        if segue.identifier == "Detail" {
            guard let detail = segue.destination as? DetailViewController else { return }
            detail.viewModel = DetailViewModel(item: viewModel.selectedItem())
        } else if segue.identifier == "Sort" {
            guard let sortViewController = segue.destination as? SortViewController else { return }
            sortViewController.delegate = self
            sortViewController.sheetPresentationController?.detents = [.medium(), .large()]
        }
    }
    
    @IBAction func sortPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "Sort", sender: self)
    }
    
    func sortViewController(_ viewController: SortViewController, didChooseSortOption sortOption: String?, sortOrder: String?, perPage: Int?) {
        viewModel.sortOption = sortOption
        viewModel.sortOrder = sortOrder
        guard let searchKeyword = searchBar.text, !searchKeyword.isEmpty else { return }
        viewModel.fetchRepositoryData(keyword: searchKeyword) { (error) in
            if let error = error {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func resetCell() {
        viewModel.items.removeAll()
        viewModel.currentPage = 1
        tableView.reloadData()
    }
    
}
