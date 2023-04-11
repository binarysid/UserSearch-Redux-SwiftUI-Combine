//
//  NetworkError.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 23/3/23.
//

import Foundation

enum NetworkError: Error {
    case serviceNotFound
    case badURL
    case noDataFound
    case duplicate
    case invalidResponse
    case decoding
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .serviceNotFound: return "Service unreachable"
        case .badURL: return "Invalid URL"
        case .noDataFound: return "No data found"
        case .duplicate: return "Duplicate found"
        case .invalidResponse: return "invalid response"
        case .decoding: return "Failed to decode"
        }
    }
}
