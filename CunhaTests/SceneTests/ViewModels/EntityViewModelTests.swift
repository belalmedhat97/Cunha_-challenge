//
//  EntityViewModelTests.swift
//  CunhaTests
//
//  Created by belal medhat on 03/09/2023.
//

import XCTest
import Combine
@testable import Cunha
@MainActor

final class EntityViewModelTests: XCTestCase {
    var viewModel:EntitesViewModel?
    var cancellable = Set<AnyCancellable>()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = EntitesViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    func test_get_entities(){
        // given
        viewModel?.service = ApiRequestsManagerMock()

        let expectation = self.expectation(description: "load Entities")
        viewModel?.$listOfEntites.dropFirst(2)
            .sink(receiveValue: {
                XCTAssertEqual($0?[0].symbol, "MSFT")
                expectation.fulfill()
            })
            .store(in: &cancellable)
        // when
        viewModel?.getEntities(by: "")
        // then
        wait(for: [expectation], timeout: 10)
    }

    func test_get_entity_error(){
        // given
        viewModel?.service = ApiRequestsManagerFailMock()
        let expectation = self.expectation(description: "test fail entities")
            
        viewModel?.$error.dropFirst(2)
            .sink(receiveValue: {
                XCTAssertEqual($0.show,true)
                expectation.fulfill()
            })
            .store(in: &cancellable)
        // when
        viewModel?.getEntities(by: "")
        // then
        wait(for: [expectation], timeout: 10)

    }
}
