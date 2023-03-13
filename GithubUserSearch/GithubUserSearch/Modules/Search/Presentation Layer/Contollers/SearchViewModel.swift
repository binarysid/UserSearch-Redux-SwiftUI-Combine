//
//  SearchViewModel.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation
import Combine

final class SearchViewModel:SearchViewModelProtocol{
    @Inject
    private var searchUseCase: SearchUseCaseProtocol
    @Published var searchQuery: String = ""
    @MainActor @Published var data:[SearchDTO] = []
    private var cancellables: Set<AnyCancellable> = []

    init() {
        self.searchTextBinding()
    }

    func search(query: String) {
        Task {
            let searchResults = await searchUseCase.search(by: query)
            guard case .success(let data) = searchResults else{
                return
            }
            await MainActor.run(body: {
                self.data = data
            })
        }
    }
}

extension SearchViewModel{
    private func searchTextBinding(){
        $searchQuery
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.search(query: query)
            }
            .store(in: &cancellables)
    }
}
