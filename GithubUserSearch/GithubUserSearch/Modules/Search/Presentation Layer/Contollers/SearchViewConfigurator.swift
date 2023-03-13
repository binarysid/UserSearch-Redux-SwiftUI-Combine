//
//  SearchViewConfigurator.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import SwiftUI

struct SearchViewConfigurator: ViewConfigurator{
    func configure() -> some View {
        self.registerDependency()
        let viewModel = SearchViewModel()
        return SearchView(viewModel: viewModel)
    }
    private func registerDependency(){
        let container = DIContainer.shared
        container.register(type: SearchAPIClientProtocol.self, component: SearchAPIClient())
        container.register(type: SearchRepositoryProtocol.self, component: SearchRepository())
        container.register(type: SearchUseCaseProtocol.self, component: SearchUseCase())
    }
}

