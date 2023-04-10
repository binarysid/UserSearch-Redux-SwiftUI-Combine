//
//  SearchRepositoryTest.swift
//  GithubUserSearchTests
//
//  Created by Linkon Sid on 13/3/23.
//

import XCTest
@testable import GithubUserSearch

final class SearchRepositoryTest: XCTestCase {
    private var repository:SearchRepository!
    private var dataSource:MockSearchAPIDataSource!
    private let validSource = "@Mock-GitUsers"
    private let emptyDataSource = "@Mock-Empty-GitUsers"
    var expectation:XCTestExpectation!
    
    override func setUp() {
        dataSource = MockSearchAPIDataSource(dataSource: validSource)
        DIContainer.shared.register(type: SearchAPIDataSourceProtocol.self, component: dataSource!)
        repository = SearchRepository()
        expectation = expectation(description: "Git user search repository test expectation")
    }
    func test_non_empty_DTO() async{
        let result = await repository.getData(by: "", limit: 30)
        guard case .success(let data) = result else{
            XCTFail("No Data Found from repository")
            self.expectation.fulfill()
            return
        }
        XCTAssertTrue(data.count>0, "Data from repository returned Empty")
        do{
            let dto = try XCTUnwrap(data.first)
            XCTAssertTrue(dto.name.count>0, "name property in DTO missing in Repository")
        }catch{
            XCTFail("DTO Conversion failed in Repository")

        }
        self.expectation.fulfill()
        await self.waitForExpectations(timeout: 2.0, handler: nil)
    }
    override func tearDown()  {
        dataSource = nil
        repository = nil
        expectation = nil
    }

   

}
