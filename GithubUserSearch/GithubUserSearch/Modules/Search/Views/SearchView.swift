//
//  ContentView.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import SwiftUI
import Combine

struct SearchView: View {

    @EnvironmentObject var viewModel: SearchViewModel

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchQuery)
                                    .padding(.top)
                SearchResultsView(data: viewModel.store.state.search.viewData)
            }
        }
//        .navigationBarTitle(Text(viewModel.getAppTitle()))
//        .onDisappear {
//            viewModel.cancelSearchTask()
//        }
    }
}

// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
// }
