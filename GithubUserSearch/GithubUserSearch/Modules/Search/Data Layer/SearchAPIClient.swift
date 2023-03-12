//
//  SearchAPIClient.swift
//  GithubUsers
//
//  Created by Linkon Sid on 13/3/23.
//

import Foundation

struct SearchAPIClient:SearchAPIClientProtocol{
    func getData(by name:String) async -> Result<[GitHubUser],APIManager.CustomError> {
        guard let request = APIManager.EndPoints.Users(name: name).request else{
            return .failure(.BadURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let userData = try JSONDecoder().decode(GitHubResponse.self, from: data)
            return .success(userData.items)
        } catch{
            return .failure(.ServiceNotFound)
        }
    }
}

