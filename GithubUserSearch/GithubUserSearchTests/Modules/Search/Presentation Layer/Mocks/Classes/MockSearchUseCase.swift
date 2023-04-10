//
//  MockSearchUseCase.swift
//  GithubUserSearchTests
//
//  Created by Linkon Sid on 13/3/23.
//

import Foundation
@testable import GithubUserSearch

final class MockSearchUseCase:SearchUseCaseProtocol{
    func search(by name: String, limit:Int) async -> Result<[GithubUserSearch.SearchDTO], GithubUserSearch.RequestManager.CustomError> {
        return .success(SearchDTOMock)
    }
}
