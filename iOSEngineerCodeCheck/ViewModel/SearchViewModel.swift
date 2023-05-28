//
//  SearchViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/25.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

class SearchViewModel {
    
    private let repositoryService: RepositoryService
    var items: [Item] = []
    var selectedRepositoryIndex: Int = 0
    var sortOption: String?
    var sortOrder: String?
    var perPage: Int?
    var currentPage: Int = 1
    var reachedEndOfData = false
    
    init(repositoryService: RepositoryService = .shared) {
        self.repositoryService = repositoryService
    }
    
    func fetchRepositoryData(keyword: String, completion: @escaping (Error?) -> Void) {
        if reachedEndOfData { return }
        
        repositoryService.fetchRepositoryData(keyword: keyword, sort: sortOption, order: sortOrder, page: currentPage, perPage: perPage) { [weak self] result in
            switch result {
            case .success(let data):
                self?.items += data.items
                if data.items.count == 0 {
                    self?.reachedEndOfData = true
                } else {
                    self?.currentPage += 1
                }
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func selectedItem() -> Item {
        return items[selectedRepositoryIndex]
    }
    
}

