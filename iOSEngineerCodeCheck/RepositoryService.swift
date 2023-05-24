//
//  RepositoryService.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/24.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

class RepositoryService {
    static func fetchRepositoryData(keyword: String, completion: @escaping (Result<RepositoryData, Error>) -> Void) {
        let urlString = "https://api.github.com/search/repositories?q=\(keyword)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let safeData = data else { return }
            
            do {
                let json = try JSONDecoder().decode(RepositoryData.self, from: safeData)
                completion(.success(json))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
