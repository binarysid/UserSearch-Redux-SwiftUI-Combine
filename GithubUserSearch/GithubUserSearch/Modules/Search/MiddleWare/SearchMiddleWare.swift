//
//  SearchMiddleWare.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 10/4/23.
//
import Foundation
import Combine

struct SearchMiddleWare {
    func callAsFunction(using service: UserSearching) -> Middleware<AppState, AppAction> {
        return { _, action in
            switch action {
            case .userSearch(action: .search(query: let name, limit: let limit)):
                return service.fetchSearchResult(by: name, limit: limit)
                    .subscribe(on: DispatchQueue.main)
                    .map { AppAction.userSearch(action: .searchComplete(data: $0.items))}
                    .catch {(error: NetworkError) -> Just<AppAction> in
                        Just(AppAction.userSearch(action: .searchError(error: error)))
                    }
                    .eraseToAnyPublisher()
            default:
                break
            }
            return Empty().eraseToAnyPublisher()
        }
    }
}
