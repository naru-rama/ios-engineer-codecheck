//
//  RepositoryData.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/24.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

struct RepositoryData: Decodable {
    let items: [Item]
}

struct Item: Decodable {
    let language: String?
    let starCount: Int
    let watcherCount: Int
    let forkCount: Int
    let issueCount: Int
    let fullName: String
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case language
        case starCount = "stargazers_count"
        case watcherCount = "watchers_count"
        case forkCount = "forks_count"
        case issueCount = "open_issues_count"
        case fullName = "full_name"
        case owner
    }
    
}

struct Owner: Decodable {
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
}
