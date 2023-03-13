//
//  SearchUseCase.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation

// This use case holds the business logic to perform search related task. this connects with the repository to fetch data
struct SearchUseCase:SearchUseCaseProtocol {
    
    @Inject
    private var repository:SearchRepositoryProtocol
    
    func search(by name:String) async-> Result<[SearchDTO],APIManager.CustomError>{
        
        let result = await repository.getData(by: name, limit: 30)
        return result
    }
}

