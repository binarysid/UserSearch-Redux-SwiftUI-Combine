//
//  ContentView.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import SwiftUI

struct SearchView<T:SearchViewModelProtocol>: View {
    
    @ObservedObject var viewModel: T

    var body: some View {
        NavigationView{
            VStack {
                SearchBar(text: $viewModel.searchQuery)
                    .padding(.top)
                SearchResultsView<SearchViewModel>(data: viewModel.viewData)
            }
            .environmentObject(viewModel)
        }
        .navigationBarTitle(Text(AppConstants.Common.Title.main))
        .onDisappear{
            viewModel.cancelSearchTask()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
