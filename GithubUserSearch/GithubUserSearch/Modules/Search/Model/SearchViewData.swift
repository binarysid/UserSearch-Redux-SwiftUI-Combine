//
//  SearchViewData.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 14/3/23.
//

import Foundation

struct SearchViewData: Identifiable, Hashable {
    var id: Int
    var name: String
    var avatar: URL?
    var repos: URL?
    var followers: URL?
}
