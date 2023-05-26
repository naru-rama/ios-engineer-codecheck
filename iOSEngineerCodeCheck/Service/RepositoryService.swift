//
//  RepositoryService.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/24.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

class RepositoryService {
    
    static let shared = RepositoryService()
    private var dataTask: URLSessionDataTask?

    func fetchRepositoryData(keyword: String, sort: String?, order: String?, perPage: Int?, completion: @escaping (Result<RepositoryData, Error>) -> Void) {
        var components = URLComponents(string: "https://api.github.com/search/repositories")
        components?.queryItems = [
            URLQueryItem(name: "q", value: keyword),
            URLQueryItem(name: "sort", value: sort),
            URLQueryItem(name: "order", value: order),
            URLQueryItem(name: "per_page", value: String(perPage ?? 30))
        ]
        
        guard let url = components?.url else { return }

        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
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
        dataTask?.resume()
    }
    
}

