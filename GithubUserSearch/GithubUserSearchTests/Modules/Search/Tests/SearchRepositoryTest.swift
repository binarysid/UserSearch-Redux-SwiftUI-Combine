//
//  SearchRepositoryTest.swift
//  GithubUserSearchTests
//
//  Created by Linkon Sid on 13/3/23.
//

import XCTest
@testable import GithubUserSearch

final class SearchRepositoryTest: XCTestCase {
    private var dataSource:MockSearchAPIClient!
    private let validSource = "@Mock-GitUsers"
    private let emptyDataSource = "@Mock-Empty-GitUsers"
    
    override func setUp() {
       dataSource = MockSearchAPIClient(dataSource: validSource)
    }
    func test_non_empty_data(){
        
    }
    override func tearDown()  {
        dataSource = nil
    }

   

}
