//
//  SearchDebounceMiddleWare.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 11/4/23.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    var store: AppStore
    private let debounceTime: Int
    private let queryLimit: Int
    private var cancellables: Set<AnyCancellable> = []

    init(store: AppStore,
         debounceTime: Int,
         queryLimit: Int) {
        self.store = store
        self.debounceTime = debounceTime
        self.queryLimit = queryLimit
        searchTextBinding()
    }

    private func searchTextBinding() {
        $searchQuery
    .debounce(for: .milliseconds(debounceTime), scheduler: DispatchQueue.main) // pause for 500 milsec before requesting
            .removeDuplicates()
            .sink { [weak self] query in
                guard let self = self else {return}
                self.store.dispatch(.userSearch(action: .search(query: query, limit: self.queryLimit)))
            }
            .store(in: &cancellables)
    }
}
