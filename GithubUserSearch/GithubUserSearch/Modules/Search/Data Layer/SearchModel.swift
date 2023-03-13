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
    let avatarURL: String
    let reposURL: String
    let followersURL: String
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case reposURL = "repos_url"
        case followersURL = "followers_url"
    }
}

extension GitHubUser{
    func toDomainObj()->SearchDTO{
        return SearchDTO(id: id, name: login, avatar: avatarURL,repos:reposURL,followers: followersURL)
    }
}
