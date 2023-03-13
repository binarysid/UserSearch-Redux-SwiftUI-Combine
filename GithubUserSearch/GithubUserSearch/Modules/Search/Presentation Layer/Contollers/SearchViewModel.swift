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
    private var searchTask:Task<(), Never>? = nil
    
    init() {
        self.searchTextBinding()
    }
    func cancelSearchTask(){
        searchTask?.cancel()
        searchTask = nil
    }
}

// MARK: Search bindings & task
extension SearchViewModel{
    private func searchTextBinding(){
        $searchQuery
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main) // pause for 500 milsec before requesting
            .removeDuplicates()
            .sink { [weak self] query in
                self?.search(query: query)
            }
            .store(in: &cancellables)
    }
    private func search(query: String) {
        if isSearchTaskRunning() {cancelSearchTask()} //cancel the current running task before creating a new task
        self.createSearchTask(by: query)
    }
    private func createSearchTask(by query: String){
        searchTask = Task {
            if Task.isCancelled{ //if task is already cancelled we don't need to request
                return
            }
            let searchResults = await searchUseCase.search(by: query)
            guard case .success(let data) = searchResults else{
                return
            }
            await MainActor.run(body: { //update the data on main thread as this will be updating the view
                self.data = data
            })
        }
    }
    private func isSearchTaskRunning()->Bool{
        searchTask != nil
    }
}
