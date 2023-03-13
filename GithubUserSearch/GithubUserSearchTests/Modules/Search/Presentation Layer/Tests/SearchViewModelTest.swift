//
//  SearchViewModelTest.swift
//  GithubUserSearchTests
//
//  Created by Linkon Sid on 13/3/23.
//

import XCTest
import Combine

@testable import GithubUserSearch

final class SearchViewModelTest: XCTestCase {
    private var viewModel:SearchViewModel!
    private var searchUseCase:MockSearchUseCase!
    var expectation:XCTestExpectation!
    private var cancellables: Set<AnyCancellable> = []
    
    override func setUp(){
        searchUseCase = MockSearchUseCase()
        DIContainer.shared.register(type: SearchUseCaseProtocol.self, component: searchUseCase!)
        viewModel = SearchViewModel()
        expectation = expectation(description: "Git user viewModel test expectation")
    }
    func test_search_query_result(){
        viewModel.searchQuery = "bin"
        DispatchQueue.main.asyncAfter(deadline: .now()+2){[weak self] in
            guard let self = self else{return}
            XCTAssertTrue(self.viewModel.data.count>0,"No data found to update viewmodel data")
            self.expectation.fulfill()
        }
        self.waitForExpectations(timeout: 2.0, handler: nil)
    }
    override func tearDown(){
        searchUseCase = nil
        viewModel = nil
        expectation = nil
    }

}
