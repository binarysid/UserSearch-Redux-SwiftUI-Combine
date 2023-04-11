//
//  SearchReducer.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 10/4/23.
//

import Foundation

let searchReducer: Reducer<SearchState, SearchAction> = {state, action in
    var newState = state

    switch action {
    case .search(query: let name, limit: let limit):
        newState.isSearching = true
    case .searchComplete:
        newState.isSearching = false
    case .searchPresent(users: let users):
        newState.viewData = users
    default:
        break
    }

    return newState
}
