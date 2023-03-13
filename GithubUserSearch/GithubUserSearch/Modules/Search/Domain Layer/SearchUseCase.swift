//
//  SearchUseCase.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation

struct SearchUseCase:SearchUseCaseProtocol {
    
    @Inject
    private var repository:SearchRepositoryProtocol
    
    func search(by name:String) async-> Result<[SearchDTO],APIManager.CustomError>{
        
        let result = await repository.getData(by: name)
        return result
    }
}

