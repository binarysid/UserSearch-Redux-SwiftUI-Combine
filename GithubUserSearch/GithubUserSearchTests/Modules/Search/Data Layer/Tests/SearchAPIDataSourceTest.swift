//
//  SearchAPIDataSourceTest.swift
//  GithubUserSearchTests
//
//  Created by Linkon Sid on 13/3/23.
//

import XCTest
import WebService
@testable import GithubUserSearch

final class SearchAPIDataSourceTest: XCTestCase {
    private var dataSource: SearchAPIDataSource!
    private var apiClient:MockAPIClient!
    private let validSource = "@Mock-GitUsers"
    private let emptyDataSource = "@Mock-Empty-GitUsers"
    var expectation:XCTestExpectation!
    
    override func setUp() {
        apiClient = MockAPIClient()
        DIContainer.shared.register(type: WebServiceProtocol.self, component: apiClient!)
        dataSource = SearchAPIDataSource()
        expectation = expectation(description: "Git user search data source test expectation")
    }
    func test_non_empty_data() async{
        do{
            try apiClient.setData(from: self.validSource)
            let result = await dataSource.getSearchData(by: "", limit: 10)
            guard case .success(let data) = result else{
                XCTFail("Search Data not found")
                self.expectation.fulfill()
                return
            }
            XCTAssertTrue(data.count>0, "Search Data Empty")
            self.expectation.fulfill()
        }catch{
            XCTFail("Data Source not set properly")
        }
        await self.waitForExpectations(timeout: 2.0, handler: nil)
    }
//    func test_empty_data() async{
//        do{
//            try apiClient.setData(from: self.emptyDataSource)
//            let result = await dataSource.getSearchData(by: name)
//            guard case .success(_) = result else{
//                XCTAssertTrue(true, "Search Data found on non-empty test")
//                self.expectation.fulfill()
//                return
//            }
//            XCTFail("Search Data found on non-empty test")
//            self.expectation.fulfill()
//        }catch{
//            XCTFail("Data Source not set properly")
//        }
//        await self.waitForExpectations(timeout: 0.0, handler: nil)
//    }
    override func tearDown()  {
        expectation = nil
        dataSource = nil
        apiClient = nil
    }
}
