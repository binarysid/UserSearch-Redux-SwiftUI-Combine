//
//  SearchAPIClient.swift
//  GithubUsers
//
//  Created by Linkon Sid on 13/3/23.
//

import Foundation

struct SearchAPIDataSource:SearchAPIDataSourceProtocol{
    @Inject
    private var apiClient:APIClientProtocol
    func getSearchData(by name:String) async -> Result<[GitHubUser],APIManager.CustomError> {
        guard let request = APIManager.EndPoints.Users(name: name).request else{
            return .failure(.BadURL)
        }
        do {
            let (data, _) = try await apiClient.getData(for: request)
            let userData = try JSONDecoder().decode(GitHubResponse.self, from: data)
            guard userData.items.count>0 else{return .failure(.NoDataFound)}
            return .success(userData.items)
        } catch{
            return .failure(.ServiceNotFound)
        }
    }
}

