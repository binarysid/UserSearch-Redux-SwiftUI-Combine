//
//  SearchRepository.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation

struct SearchRepository:SearchRepositoryProtocol{
    @Inject
    private var dataSource:SearchAPIClientProtocol
    func getData(by name:String) async-> Result<[SearchDTO],APIManager.CustomError>{
        
        let result = await dataSource.getData(by: name)
        guard case .success(let data) = result else{
            return .failure(.ServiceNotFound)
        }
        let users = data.map{ $0.toDomainObj() }
        return .success(users)
    }
}


