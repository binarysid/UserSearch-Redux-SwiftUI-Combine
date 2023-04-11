//
//  WebService.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 11/4/23.
//

import Foundation
import Combine

protocol WebService {
    func fetchData(_ request: URLRequest) -> AnyPublisher<Data, URLError>
}

extension WebService {
    func fetchData(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        URLSession.shared.dataTaskPublisher(for: request)
            .map({ $0.data })
            .eraseToAnyPublisher()
    }
}
