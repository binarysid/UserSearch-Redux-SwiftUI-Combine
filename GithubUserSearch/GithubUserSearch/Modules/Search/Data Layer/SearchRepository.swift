//
//  SearchRepository.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation

// Connects with data source(local/remote) to return the data back to it's requestor. it basically returns DTO
struct SearchRepository:SearchRepositoryProtocol{
    
    @Inject
    private var dataSource:SearchAPIDataSourceProtocol
    
    func getData(by name:String, limit:Int) async-> Result<[SearchDTO],APIManager.CustomError>{
        
        let result = await dataSource.getSearchData(by: name)
        guard case .success(let data) = result else{
            return .failure(.serviceNotFound)
        }
        let dataLimit = data.count>=limit ? limit : data.count
        let users = self.mapToDTO(data: Array(data[0..<dataLimit]))
        return .success(users)
    }
}

// MARK: DTO Mapping
extension SearchRepository{
    func mapToDTO(data:[GitHubUser])->[SearchDTO]{
        data.map{ $0.toDomainObj() }
    }
}

