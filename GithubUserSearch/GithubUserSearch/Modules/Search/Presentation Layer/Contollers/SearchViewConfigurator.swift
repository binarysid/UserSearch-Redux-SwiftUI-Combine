//
//  SearchViewConfigurator.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import SwiftUI
import WebService
// This configurator builds
// the Search View along with all it's dependencies
// required to perform all search related tasks
struct SearchViewConfigurator: ViewConfiguratorProtocol {
    func configure() -> some View {
        self.registerDependency()
        let viewModel = SearchViewModel()
        return SearchView(viewModel: viewModel)
    }
}

// MARK: Dependency Registration
extension SearchViewConfigurator {
    private func registerDependency() {
        let container = DIContainer.shared
        container.register(type: WebServiceProtocol.self, component: WebService())
        container.register(type: SearchAPIDataSourceProtocol.self, component: SearchAPIDataSource())
        container.register(type: SearchRepositoryProtocol.self, component: SearchRepository())
        container.register(type: SearchUseCaseProtocol.self, component: SearchUseCase())
        container.register(type: SearchRouterProtocol.self, component: SearchRouter())
    }
}
