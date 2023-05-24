//
//  RepositoryDataController.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/24.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

class RepositoryDataController {
    weak var searchViewController: SearchViewController?
    
    func getRepositoryData() -> [String: Any]? {
        guard let searchVC = searchViewController else { return nil }
        let repository = searchVC.repositories[searchVC.selectedRepositoryIndex]
        return repository
    }
}
