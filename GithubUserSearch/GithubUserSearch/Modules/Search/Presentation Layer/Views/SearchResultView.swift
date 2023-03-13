//
//  SearchResultView.swift
//  GithubUsers
//
//  Created by Linkon Sid on 13/3/23.
//

import SwiftUI

struct SearchResultsView: View {
    
    var data: [SearchViewData] = []
    
    var body: some View {
        List(data) { result in
            SearchListCell(item: result)
        }
    }
}
