//
//  MockAPIClient.swift
//  GithubUserSearchTests
//
//  Created by Linkon Sid on 13/3/23.
//

import Foundation
@testable import GithubUserSearch

final class MockAPIClient:APIClientProtocol{
    private var data: Data?
    private var error: Error?
    let testBundle = Bundle(for: GithubUserSearchTests.self)
    
    func getData(for request: URLRequest) async throws -> (Data, URLResponse) {
       guard let data = data else {
           throw error ?? NSError(domain: "Unknown error", code: 0, userInfo: nil)
       }
       let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
       return (data, response)
    }
}

extension MockAPIClient{
    func setData(from source:String) throws{
        guard let url =
                testBundle.url(forResource:source,withExtension:"json") else{
            guard let error = error else{return}
            throw error
        }
        do
        {
            data = try Data(contentsOf: url)
        }catch{
            throw error
        }
    }
}
