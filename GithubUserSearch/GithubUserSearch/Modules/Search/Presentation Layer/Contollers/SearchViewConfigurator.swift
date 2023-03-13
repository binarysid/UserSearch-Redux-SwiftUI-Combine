//
//  SearchViewConfigurator.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import SwiftUI

// This configurator builds the Search View along with all it's dependencies required to perform all search related tasks
struct SearchViewConfigurator: ViewConfiguratorProtocol{
    func configure() -> some View {
        self.registerDependency()
        let viewModel = SearchViewModel()
        return SearchView(viewModel: viewModel)
    }
}

// MARK: Dependency Registration
extension SearchViewConfigurator{
    private func registerDependency(){
        let container = DIContainer.shared
        container.register(type: APIClientProtocol.self, component: APIClient())
        container.register(type: SearchAPIDataSourceProtocol.self, component: SearchAPIDataSource())
        container.register(type: SearchRepositoryProtocol.self, component: SearchRepository())
        container.register(type: SearchUseCaseProtocol.self, component: SearchUseCase())
    }
}
