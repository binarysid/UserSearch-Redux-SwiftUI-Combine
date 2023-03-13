//
//  SearchViewModelTest.swift
//  GithubUserSearchTests
//
//  Created by Linkon Sid on 13/3/23.
//

import XCTest
@testable import GithubUserSearch

final class SearchViewModelTest: XCTestCase {
    private var viewModel:SearchViewModel!
    private var searchUseCase:MockSearchUseCase!
    var expectation:XCTestExpectation!
    
    override func setUp(){
        searchUseCase = MockSearchUseCase()
        DIContainer.shared.register(type: SearchUseCaseProtocol.self, component: searchUseCase!)
        viewModel = SearchViewModel()
        expectation = expectation(description: "Git user viewModel test expectation")
    }
    func test_search_query_result(){
        viewModel.searchQuery = "bin"
        
    }
    override func tearDown(){
        searchUseCase = nil
        viewModel = nil
        expectation = nil
    }

}
