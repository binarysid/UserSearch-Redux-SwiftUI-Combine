//
//  SearchViewModel.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation
import Combine

// ViewModel communicates with Domain layer in order to manage presentation data for View and handle Routing.
final class SearchViewModel{
    @Inject
    private var searchUseCase: SearchUseCaseProtocol
    @Inject
    private var router: SearchRouterProtocol
    @Published var searchQuery: String = ""
    @MainActor @Published var viewData:[SearchViewData] = []
    private var cancellables: Set<AnyCancellable> = []
    private var searchTask:Task<(), Never>? = nil
    private let requestLimit = 10
    private let debounceTime = 500
    
    init() {
        self.searchTextBinding()
    }
}

extension SearchViewModel:SearchViewModelProtocol{
    func cancelSearchTask(){
        searchTask?.cancel()
        searchTask = nil
    }
    func navigateToDetail(reposURL:URL?,followersURL:URL?){
        guard let repositoryLink = reposURL else{ // for navigate to detail view repository url is mandatory
            return
        }
        router.presentDetailView(reposURL: repositoryLink, followersURL: followersURL)
    }
}

// MARK: Search bindings & task
extension SearchViewModel{
    private func searchTextBinding(){
        $searchQuery
            .debounce(for: .milliseconds(debounceTime), scheduler: DispatchQueue.main) // pause for 500 milsec before requesting
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
    // requesting data from domain layer
    private func createSearchTask(by query: String){
        searchTask = Task {
            if Task.isCancelled{ //if task is already cancelled we don't need to request
                return
            }
            let searchResults = await searchUseCase.search(by: query, limit: requestLimit)
            guard case .success(let data) = searchResults else{
                return
            }
            await MainActor.run(body: { //update the data on main thread as this will be updating the view
                self.viewData = data.map{
                    mapPresentationData(from: $0)
                }
            })
        }
    }
    private func isSearchTaskRunning()->Bool{
        searchTask != nil
    }
}

// MARK: Presentation
extension SearchViewModel{
    private func mapPresentationData(from data:SearchDTO)->SearchViewData{
        SearchViewData(id: data.id, name: data.name,avatar: URL(string: data.avatar ?? ""), repos: URL(string: data.repos ?? ""), followers: URL(string: data.followers ?? ""))
    }
}
