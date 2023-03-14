//
//  APIClient.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 13/3/23.
//

import Foundation

// Generic Client that can be utilized by all the classes/structs that need to fetch data from remote location
protocol APIClientProtocol{
    func getData(for request: URLRequest) async throws -> (Data, URLResponse)
}

// default implementation
extension APIClientProtocol{
    func getData(for request: URLRequest) async throws -> (Data, URLResponse){
        do {
            let result = try await URLSession.shared.data(for: request)
            return result
        } catch{
            throw error
        }
    }
}

struct APIClient:APIClientProtocol{

}
