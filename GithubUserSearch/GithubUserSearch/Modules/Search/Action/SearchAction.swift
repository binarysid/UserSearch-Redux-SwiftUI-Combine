//
//  SearchAction.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 10/4/23.
//

import Foundation

enum SearchAction {
    case search(query: String, limit: Int)
    case searchComplete(data: [GitHubUser])
    case searchPresent(users: [SearchViewData])
    case searchError(error: NetworkError)
}
