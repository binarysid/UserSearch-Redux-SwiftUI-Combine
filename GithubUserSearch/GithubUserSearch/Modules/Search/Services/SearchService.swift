//
//  SearchService.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 11/4/23.
//

import Foundation
import Combine

protocol UserSearching {
    func fetchSearchResult(by name: String, limit: Int) -> AnyPublisher<GitHubResponse, NetworkError>
}

struct SearchService: WebService, UserSearching {
    func fetchSearchResult(by name: String, limit: Int) -> AnyPublisher<GitHubResponse, NetworkError> {
        guard let request = EndPoints.userSearch(name: name, limit: limit).request else {
            return Empty().eraseToAnyPublisher()
        }

        return fetchData(request)
            .decode(type: GitHubResponse.self, decoder: JSONDecoder())
            .mapError { error in
                switch error {
                case is Swift.DecodingError:
                    return NetworkError.decoding
                default:
                    return NetworkError.noDataFound
                }
            }
            .eraseToAnyPublisher()
    }
}
