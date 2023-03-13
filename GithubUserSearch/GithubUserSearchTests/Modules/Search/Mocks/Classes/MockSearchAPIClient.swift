//
//  MockSearchAPIClient.swift
//  GithubUserSearchTests
//
//  Created by Linkon Sid on 13/3/23.
//

import Foundation
@testable import GithubUserSearch

struct MockSearchAPIClient:SearchAPIDataSourceProtocol{
    var dataSource:String
    func getSearchData(by name: String) async -> Result<[GithubUserSearch.GitHubUser], GithubUserSearch.APIManager.CustomError> {
        let testBundle = Bundle(for: GithubUserSearchTests.self)
        guard let url =
                testBundle.url(forResource:dataSource,withExtension:"json") else{
            return .failure(.BadURL)
        }
        do
        {
            let data = try Data(contentsOf: url)
            let userData = try JSONDecoder().decode(GitHubResponse.self, from: data)
            guard userData.items.count>0 else{return .failure(.NoDataFound)}
            return .success(userData.items)
        }catch{
            return .failure(.ServiceNotFound)
        }
    }
    
    
    
}
