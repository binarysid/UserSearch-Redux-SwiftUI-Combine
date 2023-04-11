////
////  SearchViewConfigurator.swift
////  GithubUsers
////
////  Created by Linkon Sid on 12/3/23.
////
//
import SwiftUI
import WebService
// This configurator builds
// the Search View along with all it's dependencies
// required to perform all search related tasks
struct SearchViewConfigurator: ViewConfigurator {
    func configure() -> some View {
        let searchMiddleWare = SearchMiddleWare()
        let presenterMiddleWare = SearchPresentationMiddleWare()
        let store = AppStore(state: .init(search: SearchState()), middleWares: [searchMiddleWare(using: SearchService()), presenterMiddleWare(using: SearchPresenter())], reducer: appReducer)
        let viewModel = SearchViewModel(store: store, debounceTime: 500, queryLimit: 10)
        return SearchView()
            .environmentObject(viewModel)
    }
}
