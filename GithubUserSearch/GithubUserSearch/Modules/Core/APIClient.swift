//
//  APIClient.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 13/3/23.
//

import Foundation

protocol APIClientProtocol{
    func getData(for request: URLRequest) async throws -> (Data, URLResponse)
}
struct APIClient:APIClientProtocol{
    func getData(for request: URLRequest) async throws -> (Data, URLResponse){
        do {
            let result = try await URLSession.shared.data(for: request)
            return result
        } catch{
            throw error
        }
    }
}
