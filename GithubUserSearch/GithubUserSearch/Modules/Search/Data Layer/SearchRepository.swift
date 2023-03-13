//
//  SearchRepository.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation

// Connects with data source(local/remote) to return the data back to it's requestor. it basically returns DTO
struct SearchRepository{
    @Inject
    private var dataSource:SearchAPIDataSourceProtocol
}

extension SearchRepository:SearchRepositoryProtocol{
    func getData(by name:String, limit: Int) async-> Result<[SearchDTO],APIManager.CustomError>{
        
        let result = await dataSource.getSearchData(by: name, limit: limit)
        guard case .success(let data) = result else{
            return .failure(.serviceNotFound)
        }
        let users = self.mapToDTO(data: data)
        return .success(users)
    }
}

// MARK: DTO Mapping
extension SearchRepository{
    func mapToDTO(data:[GitHubUser])->[SearchDTO]{
        data.map{ $0.toDomainObj() }
    }
}

