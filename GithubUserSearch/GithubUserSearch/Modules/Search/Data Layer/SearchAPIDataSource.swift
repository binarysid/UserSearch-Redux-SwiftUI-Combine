//
//  SearchAPIClient.swift
//  GithubUsers
//
//  Created by Linkon Sid on 13/3/23.
//

import Foundation

// Remote Data source. Fetch data from server, Decode the model and return it to the repository
struct SearchAPIDataSource:SearchAPIDataSourceProtocol{
    
    @Inject
    private var apiClient:APIClientProtocol
    
    func getSearchData(by name:String) async -> Result<[GitHubUser],APIManager.CustomError> {
        guard let request = APIManager.EndPoints.userSearch(name: name).request else{
            return .failure(.badURL)
        }
        do {
            let (data, _) = try await apiClient.getData(for: request)
            let userData = try JSONDecoder().decode(GitHubResponse.self, from: data)
            guard userData.items.count>0 else{return .failure(.noDataFound)}
            return .success(userData.items)
        } catch{
            return .failure(.serviceNotFound)
        }
    }
}

