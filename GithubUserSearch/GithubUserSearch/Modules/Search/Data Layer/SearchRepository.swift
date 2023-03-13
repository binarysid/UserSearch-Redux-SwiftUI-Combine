//
//  SearchRepository.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation

struct SearchRepository:SearchRepositoryProtocol{
    
    @Inject
    private var dataSource:SearchAPIDataSourceProtocol
    
    func getData(by name:String) async-> Result<[SearchDTO],APIManager.CustomError>{
        
        let result = await dataSource.getSearchData(by: name)
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

