//
//  PresentationMiddleWare.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 10/4/23.
//

import Combine
import Foundation

struct SearchPresentationMiddleWare {
    func callAsFunction(using presenter: SearchPresenting) -> Middleware<AppState, AppAction> {
        return {_, action in
            switch action {
            case .userSearch(action: .searchComplete(data: let data)):
                return presenter.mapPresentationData(from: data)
                    .subscribe(on: DispatchQueue.main)
                    .map {AppAction.userSearch(action: .searchPresent(users: $0))}
                    .eraseToAnyPublisher()
            default:
                break
            }
            return Empty().eraseToAnyPublisher()
        }
    }
}

protocol SearchPresenting {
    func mapPresentationData(from data: [GitHubUser]) -> Future<[SearchViewData], Never>
}

struct SearchPresenter: SearchPresenting {
    func mapPresentationData(from data: [GitHubUser]) -> Future<[SearchViewData], Never> {
        return Future { promise in
            let viewData = data.map {
                SearchViewData(id: $0.id, name: $0.login)
            }
            promise(.success(viewData))
        }
    }
}
