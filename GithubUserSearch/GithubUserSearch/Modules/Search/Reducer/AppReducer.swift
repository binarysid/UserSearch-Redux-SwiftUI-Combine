//
//  AppReducer.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 10/4/23.
//

import Foundation

let appReducer: Reducer<AppState, AppAction> = { state, action in
    var newState = state
    switch action {
    case .userSearch(let searchAction):
        newState.search = searchReducer(state.search, searchAction)
    }
    return newState
}
