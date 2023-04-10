//
//  SearchResultView.swift
//  GithubUsers
//
//  Created by Linkon Sid on 13/3/23.
//

import SwiftUI

struct SearchResultsView<T: SearchViewModelProtocol>: View {
    @EnvironmentObject var viewModel: T
    var data: [SearchViewData] = []

    var body: some View {
        List(data) { result in
            SearchListCell(item: result) {
                viewModel.navigateToDetail(reposURL: result.repos, followersURL: result.followers)
            }
        }
    }
}
