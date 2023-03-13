//
//  SearchUseCaseTest.swift
//  GithubUserSearchTests
//
//  Created by Linkon Sid on 13/3/23.
//

import XCTest
@testable import GithubUserSearch

final class SearchUseCaseTest: XCTestCase {
    private var searchUseCase:SearchUseCase!
    private var repository:MockSearchRepository!
    var expectation:XCTestExpectation!

    override func setUp() {
        repository = MockSearchRepository()
        DIContainer.shared.register(type: SearchRepositoryProtocol.self, component: repository!)
        searchUseCase = SearchUseCase()
        expectation = expectation(description: "Git user search use case test expectation")
    }
    func test_usecase_valid_DTO() async{
        let result = await searchUseCase.search(by: "")
        guard case .success(let data) = result else{
            XCTFail("No Data Found from use case")
            self.expectation.fulfill()
            return
        }
        XCTAssertTrue(data.count>0, "Data from use case returned Empty")
        do{
            let dto = try XCTUnwrap(data.first)
            XCTAssertTrue(dto.name.count>0, "name property in DTO missing in use case")
        }catch{
            XCTFail("Use case unable to fetch data")

        }
        self.expectation.fulfill()
        await self.waitForExpectations(timeout: 2.0, handler: nil)
    }
    override func tearDown(){
        repository = nil
        searchUseCase = nil
        expectation = nil
    }
}
