//
//  SearchAPIClient.swift
//  GithubUsers
//
//  Created by Linkon Sid on 13/3/23.
//

import Foundation

// Remote Data source. Fetch data from server, Decode the model and return it to the repository
struct SearchAPIDataSource{
    @Inject
    private var apiClient:APIClientProtocol
}

extension SearchAPIDataSource:SearchAPIDataSourceProtocol{
    func getSearchData(by name:String, limit: Int) async -> Result<[GitHubUser],APIManager.CustomError> {
        guard let request = APIManager.EndPoints.userSearch(name: name, limit: limit).request else{
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

