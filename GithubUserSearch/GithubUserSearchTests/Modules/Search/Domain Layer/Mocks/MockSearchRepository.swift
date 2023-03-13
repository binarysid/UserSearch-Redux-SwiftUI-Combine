//
//  MockSearchRepository.swift
//  GithubUserSearchTests
//
//  Created by Linkon Sid on 13/3/23.
//

import Foundation
@testable import GithubUserSearch

final class MockSearchRepository:SearchRepositoryProtocol{
    let data = [SearchDTO(id: 1, name: "binarysid"),
                SearchDTO(id: 2, name: "hharoon"),
                SearchDTO(id: 3, name: "mayckonx")
    ]
    func getData(by name: String) async -> Result<[GithubUserSearch.SearchDTO], GithubUserSearch.APIManager.CustomError> {
        return .success(data)
    }
}
