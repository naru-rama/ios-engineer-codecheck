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
    
    init(repositoryService: RepositoryService = .shared) {
        self.repositoryService = repositoryService
    }
    
    func fetchRepositoryData(keyword: String, completion: @escaping (Error?) -> Void) {
        repositoryService.fetchRepositoryData(keyword: keyword, sort: sortOption, order: sortOrder, perPage: perPage) { [weak self] result in
            switch result {
            case .success(let data):
                self?.items = data.items
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

