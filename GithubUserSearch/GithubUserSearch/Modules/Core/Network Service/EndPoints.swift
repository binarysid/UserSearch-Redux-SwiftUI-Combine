//
//  EndPoints.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 23/3/23.
//

import Foundation
import URLRequestBuilder

enum EndPoints {
    static let baseURL =  "https://" + Config.stringValue(forKey: "BASE_URL")
    static let token = Config.stringValue(forKey: "API_KEY")
    static let requestBuilder = URLRequestBuilder()

    case userSearch(name: String, limit: Int)

    var request: URLRequest? {
        switch self {
        case .userSearch(let name, let limit):
            let url = EndPoints.baseURL + "/search/users"
            return EndPoints.requestBuilder.createRequestWith(baseURL: url, params: ["q": name, "per_page": String(limit)], headers: ["Authorization": "token \(EndPoints.token)"])
        }
    }
}
