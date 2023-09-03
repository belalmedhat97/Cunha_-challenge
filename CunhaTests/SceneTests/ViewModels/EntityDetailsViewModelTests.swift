//
//  EntityIntervalsViewModelTests.swift
//  CunhaTests
//
//  Created by belal medhat on 03/09/2023.
//

import XCTest
import Combine
@testable import Cunha
@MainActor

final class EntityDetailsViewModelTests: XCTestCase {
    var viewModel:EntityDetailsViewModel?
    var cancellable = Set<AnyCancellable>()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = EntityDetailsViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    func test_get_entitiesIntervals(){
        // given
        viewModel?.service = ApiRequestsManagerMock()

        let expectation = self.expectation(description: "load Entity times")
            
        viewModel?.$entityTimes.dropFirst(2)
            .sink(receiveValue: {
                XCTAssertEqual($0?[0].symbol,"MSFT")
                expectation.fulfill()
            })
            .store(in: &cancellable)
        // when
        viewModel?.getEntityDetailsWithIntervals(by: "", from: "", to: "")
        // then
        wait(for: [expectation], timeout: 10)

    }
    func test_get_entitiesIntervals_error(){

        // given
        viewModel?.service = ApiRequestsManagerFailMock()

        let expectation = self.expectation(description: "test fail entitiesIntervals")
            
        viewModel?.$error.dropFirst(2)
            .sink(receiveValue: {
                XCTAssertEqual($0.show,true)
                expectation.fulfill()
            })
            .store(in: &cancellable)
        // when
        viewModel?.getEntityDetailsWithIntervals(by: "", from: "", to: "")

        // then
        wait(for: [expectation], timeout: 10)

    }
}
