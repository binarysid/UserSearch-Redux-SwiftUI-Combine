//
//  SearchUseCase.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation

// This use case holds the business logic to perform search related task. this connects with the repository to fetch data
struct SearchUseCase {
    @Inject
    private var repository:SearchRepositoryProtocol
}

extension SearchUseCase:SearchUseCaseProtocol{
    func search(by name:String, limit: Int) async-> Result<[SearchDTO],APIManager.CustomError>{
        
        let result = await repository.getData(by: name, limit: limit)
        return result
    }
}
