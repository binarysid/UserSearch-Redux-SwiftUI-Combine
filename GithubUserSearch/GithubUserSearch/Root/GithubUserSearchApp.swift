//
//  GithubUserSearchApp.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 13/3/23.
//

import SwiftUI

@main
struct GithubUserSearchApp: App {
    var body: some Scene {
        WindowGroup {
            SearchViewConfigurator().configure()
        }
    }
}
