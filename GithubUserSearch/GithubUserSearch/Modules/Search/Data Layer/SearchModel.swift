//
//  SearchModel.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation

struct GitHubResponse: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [GitHubUser]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct GitHubUser: Codable {
    let login: String
    let id: Int
    let avatarUrl: String
    let reposUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarUrl = "avatar_url"
        case reposUrl = "repos_url"
    }
}

extension GitHubUser{
    func toDomainObj()->SearchDTO{
        return SearchDTO(id: id, name: login, avatar: URL(string: avatarUrl),repos:URL(string: reposUrl))
    }
}
