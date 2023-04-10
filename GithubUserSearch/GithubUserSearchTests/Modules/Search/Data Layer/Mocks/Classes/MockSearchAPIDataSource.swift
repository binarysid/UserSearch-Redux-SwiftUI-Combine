//
//  MockSearchAPIClient.swift
//  GithubUserSearchTests
//
//  Created by Linkon Sid on 13/3/23.
//

import Foundation
@testable import GithubUserSearch

final class MockSearchAPIDataSource:SearchAPIDataSourceProtocol{
    var dataSource:String
    init(dataSource: String) {
        self.dataSource = dataSource
    }
    func getSearchData(by name: String, limit:Int) async -> Result<[GithubUserSearch.GitHubUser], NetworkError> {
        let testBundle = Bundle(for: GithubUserSearchTests.self)
        guard let url =
                testBundle.url(forResource:dataSource,withExtension:"json") else{
            return .failure(.badURL)
        }
        do
        {
            let data = try Data(contentsOf: url)
            let userData = try JSONDecoder().decode(GitHubResponse.self, from: data)
            guard userData.items.count>0 else{return .failure(.noDataFound)}
            return .success(userData.items)
        }catch{
            return .failure(.serviceNotFound)
        }
    }
    
    
    
}
